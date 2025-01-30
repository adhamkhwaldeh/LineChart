import 'dart:io';

import 'package:dio/dio.dart';
import 'package:enpal_assignment/bloc/base_events/base_event.dart';
import 'package:enpal_assignment/bloc/base_states/base_state.dart';
import 'package:enpal_assignment/data/enums/monitoring_type_enum.dart';
import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:enpal_assignment/di/di.dart';
import 'package:enpal_assignment/di/env.dart';
import 'package:enpal_assignment/helpers/date_helper.dart';
import 'package:enpal_assignment/repositories/cache_repository.dart';
import 'package:enpal_assignment/repositories/mocked/monitoring_mocked_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:enpal_assignment/bloc/monitoring_bloc.dart';
import 'package:enpal_assignment/di/di.dart' as di;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group(
    'MonitoringBloc Tests',
    () {
      late MonitoringBloc monitoringBloc;
      late MonitoringMockedRepository monitoringMockedRepository;
      late CacheRepository cacheRepository;

      MonitoringFilterModel defaultFilter = MonitoringFilterModel(
        type: MonitoringTypeEnum.solar,
        date: DateHelper.getDateOnly(DateTime.now())!,
        isKiloWall: false,
        forceUpdate: false,
      );

      MonitoringFilterModel defaultForceUpdateFilter =
          defaultFilter.copyWith(forceUpdate: true);

      MonitoringFilterModel defaultFilter2 = defaultFilter.copyWith(
        type: MonitoringTypeEnum.house,
      );

      final mockedData = [
        MonitoringModel(timestamp: "2025-01-08:00:05:00", value: 10),
        MonitoringModel(timestamp: "2025-01-08:00:10:00", value: 12),
      ];

      setUpAll(
        () async {
          WidgetsFlutterBinding.ensureInitialized();

          SharedPreferences.setMockInitialValues({});

          //Initialize the environment properties
          Env.init();

          //Initialize the dependencies
          await di.init();
          monitoringMockedRepository = getIt<MonitoringMockedRepository>();
          cacheRepository = getIt<CacheRepository>();
          await cacheRepository.sharedPreferences.clear();

          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
      );

      tearDownAll(
        () {
          monitoringBloc.close();
        },
      );

      test(
        'Check clearing the cache',
        () async {
          final cachedData =
              (await cacheRepository.getMonitoring(defaultFilter)) ?? [];
          expect(cachedData, []);
        },
      );

      test(
        'initial state is MonitoringBloc with BaseStateInitial',
        () async {
          expect(
              monitoringBloc.state, const BaseStateInitial<MonitoringModel>());
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'emits Internet connection issue',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          when(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).thenThrow(
            DioException.connectionTimeout(
              timeout: const Duration(seconds: 10),
              requestOptions: RequestOptions(path: '/test'),
            ),
          );
          return monitoringBloc;
        },
        act: (bloc) => bloc.add(BaseEventLoadMonitoring(defaultFilter)),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          const BaseStateProgressDismiss<MonitoringModel>(),
          const BaseStateNoInternetConnection<MonitoringModel>(),
        ],
        verify: (_) {
          verify(() => monitoringMockedRepository.getMonitoring(defaultFilter))
              .called(1);
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'emits No authorized issue',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          when(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).thenThrow(
            DioException.badCertificate(
              requestOptions: RequestOptions(path: '/test'),
              error: "Not Authorized",
            ),
          );
          return monitoringBloc;
        },
        act: (bloc) => bloc.add(BaseEventLoadMonitoring(defaultFilter)),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          const BaseStateProgressDismiss<MonitoringModel>(),
          const BaseStateNotAuthorize<MonitoringModel>(error: ""),
        ],
        verify: (_) {
          verify(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).called(1);
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'emits internal server issue',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          when(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).thenThrow(
            DioException(
              type: DioExceptionType.badResponse,
              requestOptions: RequestOptions(
                path: '/test',
              ),
              response: Response(
                statusCode: HttpStatus.badRequest,
                requestOptions: RequestOptions(
                  path: '/test',
                ),
              ),
              message: 'The request was manually cancelled by the user.',
            ),
          );
          return monitoringBloc;
        },
        act: (bloc) => bloc.add(BaseEventLoadMonitoring(defaultFilter)),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          const BaseStateProgressDismiss<MonitoringModel>(),
          const BaseStateInternalServerError<MonitoringModel>(error: ""),
        ],
        verify: (_) {
          verify(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).called(1);
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'emits empty response to handle no data found',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          when(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).thenAnswer(
            (_) async => [],
          );
          return monitoringBloc;
        },
        act: (bloc) => bloc.add(
          BaseEventLoadMonitoring(defaultFilter),
        ),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          const BaseStateProgressDismiss<MonitoringModel>(),
          const BaseStateNoDataFound<MonitoringModel>(),
        ],
        verify: (_) {
          verify(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).called(1);
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'emits success response to fetch the data properly',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          when(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).thenAnswer(
            (_) async => mockedData,
          );
          return monitoringBloc;
        },
        act: (bloc) => bloc.add(
          BaseEventLoadMonitoring(defaultFilter),
        ),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          const BaseStateProgressDismiss<MonitoringModel>(),
          BaseStateListLoadedSuccessfully<MonitoringModel>(data: mockedData),
        ],
        verify: (_) {
          verify(
            () => monitoringMockedRepository.getMonitoring(defaultFilter),
          ).called(1);
        },
      );

      test(
        'Ensure the data is cached',
        () async {
          final cachedData =
              (await cacheRepository.getMonitoring(defaultFilter)) ?? [];
          expect(cachedData, mockedData);
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'Load the data from the local storage',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          // when(
          //   () => cacheRepository.getMonitoring(defaultFilter),
          // ).thenAnswer(
          //   (_) async => mockedData,
          // );
          return monitoringBloc;
        },
        act: (bloc) => bloc.add(BaseEventLoadMonitoring(defaultFilter)),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          BaseStateListLoadedSuccessfully<MonitoringModel>(data: mockedData),
        ],
        verify: (_) {
          // verify(
          //   () => cacheRepository.getMonitoring(defaultFilter),
          // ).called(1);
          // verify(
          //   () => monitoringMockedRepository.getMonitoring(defaultFilter),
          // ).called(0);
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'Force update and skip the local storage',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          when(
            () => monitoringMockedRepository
                .getMonitoring(defaultForceUpdateFilter),
          ).thenAnswer(
            (_) async => mockedData,
          );
          return monitoringBloc;
        },
        act: (bloc) =>
            bloc.add(BaseEventLoadMonitoring(defaultForceUpdateFilter)),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          const BaseStateProgressDismiss<MonitoringModel>(),
          BaseStateListLoadedSuccessfully<MonitoringModel>(data: mockedData),
        ],
        verify: (_) {
          // verify(
          //   () => cacheRepository.getMonitoring(defaultFilter),
          // ).called(1);
          verify(
            () => monitoringMockedRepository
                .getMonitoring(defaultForceUpdateFilter),
          ).called(1);
        },
      );

      blocTest<MonitoringBloc, BaseState<MonitoringModel>>(
        'emits success response to fetch the data properly with different criteria of filtration',
        setUp: () {
          monitoringBloc = MonitoringBloc(
            monitoringMockedRepository,
            cacheRepository,
          );
        },
        tearDown: () {
          monitoringBloc.close();
        },
        build: () {
          when(
            () => monitoringMockedRepository.getMonitoring(defaultFilter2),
          ).thenAnswer(
            (_) async => mockedData,
          );
          return monitoringBloc;
        },
        act: (bloc) => bloc.add(
          BaseEventLoadMonitoring(defaultFilter2),
        ),
        expect: () => [
          const BaseStateProgress<MonitoringModel>(),
          const BaseStateProgressDismiss<MonitoringModel>(),
          BaseStateListLoadedSuccessfully<MonitoringModel>(data: mockedData),
        ],
        verify: (_) {
          verify(
            () => monitoringMockedRepository.getMonitoring(defaultFilter2),
          ).called(1);
        },
      );
    },
  );
}
