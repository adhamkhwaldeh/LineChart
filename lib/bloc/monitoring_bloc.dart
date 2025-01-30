import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:enpal_assignment/bloc/base/base_bloc.dart';
import 'package:enpal_assignment/bloc/base_events/base_event.dart';
import 'package:enpal_assignment/bloc/base_states/base_state.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:enpal_assignment/repositories/cache_repository.dart';
import 'package:enpal_assignment/repositories/imonitoring_repository.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bloc_test/bloc_test.dart';

class MonitoringBloc //<R extends IMonitoringRepository>
    extends BaseBloc<BaseEvent, BaseState<MonitoringModel>>
    implements MockBloc<BaseEvent, BaseState<MonitoringModel>> {
  final IMonitoringRepository repository;
  // final R repository;

  final CacheRepository cacheRepository;

  Timer? timer;

  MonitoringBloc(
    this.repository,
    this.cacheRepository,
  ) : super(const BaseStateInitial()) {
    on<BaseEventLoadMonitoring>(
      (event, emit) async {
        emit(const BaseStateProgress());
        try {
          //Skip the cache for forceUpdate
          if (!event.filter.forceUpdate) {
            List<MonitoringModel>? dt = await cacheRepository.getMonitoring(
              event.filter,
            );
            //Update the ui from local storage if the data already loaded
            //I've used shared preference to cache the data but we can use any ORM library or hive for none structured data or none-sql
            //While we are doing bulk update I chose shared preference
            //But if we need to update the date on the item level (sync the data update particular record I would implement orm)
            if (!dt.checkNullOrEmpty()) {
              emit(BaseStateListLoadedSuccessfully(data: dt!));
              return;
            }
          }

          //Load the data from the api
          List<MonitoringModel> dt =
              await repository.getMonitoring(event.filter);
          emit(const BaseStateProgressDismiss());
          if (dt.isNotEmpty) {
            // if the data loaded successfully I'm update both the UI and cacheRepository
            emit(BaseStateListLoadedSuccessfully(data: dt));

            //The key for storage is combined from filter criteria
            await cacheRepository.setMonitoring(event.filter, dt);
          } else {
            emit(const BaseStateNoDataFound());
          }
        } catch (error) {
          if (isClosed) return;
          emit(const BaseStateProgressDismiss());

          if (error is DioException) {
            switch (error.type) {
              case DioExceptionType.connectionTimeout:
              case DioExceptionType.sendTimeout:
              case DioExceptionType.receiveTimeout:
              case DioExceptionType.connectionError:
              case DioExceptionType.cancel:
                emit(const BaseStateNoInternetConnection());
              case DioExceptionType.badCertificate:
                emit(BaseStateNotAuthorize(
                    error: error.response?.statusMessage?.toString() ?? ""));

              case DioExceptionType.badResponse:
                if (error.response?.statusCode == HttpStatus.unauthorized) {
                  emit(BaseStateNotAuthorize(
                      error: error.response?.statusMessage?.toString() ?? ""));
                } else if (error.response?.statusCode == HttpStatus.notFound) {
                  emit(const BaseStateNoDataFound());
                } else if (error.response?.statusCode ==
                    HttpStatus.badRequest) {
                  emit(BaseStateInternalServerError(
                      error: error.response?.statusMessage?.toString() ?? ""));
                }

              case DioExceptionType.unknown:
                emit(
                  BaseStateFailure(
                      error: error.response?.statusMessage?.toString() ?? ""),
                );
            }
          } else {
            emit(BaseStateFailure(error: error.toString()));
          }
        }
      },
    );

    on<BaseEventPollingForMonitoring>((event, emit) async {
      if (timer != null && timer?.isActive == true) {
        timer?.cancel();
      }
      // const pollingDuration = 60;
      const pollingDuration = 10;
      // const pollingDuration = 5;

      //wait 60 seconds before start polling and sync the data every 60 seconds
      //It could be enhanced by implementing riverpod or add diffUtils (where we can compare the current data with the new ones)

      timer = await Future.delayed(
        const Duration(seconds: pollingDuration),
        () async => Timer.periodic(
          const Duration(seconds: pollingDuration),
          (timer) {
            //I'm calling other event to avoid nested async function
            add(BaseEventLoadRemoteMonitoringOnly(event.filter));
          },
        ),
      );
    });

    on<BaseEventLoadRemoteMonitoringOnly>(
      (event, emit) async {
        try {
          final dt = await repository.getMonitoring(event.filter);
          if (dt.isNotEmpty) {
            emit(BaseStateListLoadedSuccessfully(data: dt));

            //The key for storage is combined from filter criteria
            await cacheRepository.setMonitoring(event.filter, dt);
          }
        } catch (error) {}
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
  }
}
