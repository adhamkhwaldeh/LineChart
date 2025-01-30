import 'package:enpal_assignment/bloc/base_events/base_event.dart';
import 'package:enpal_assignment/components/enpal_app.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enpal_assignment/bloc/monitoring_bloc.dart';
import 'package:enpal_assignment/components/home_page.dart';
import 'package:enpal_assignment/di/di.dart' as di;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group(
    'HomePage Widget Tests',
    () {
      // late MonitoringMockedBloc monitoringBloc;
      late MonitoringBloc monitoringBloc;
      late MonitoringMockedRepository monitoringMockedRepository;

      late CacheRepository cacheRepository;

      MonitoringFilterModel defaultFilter = MonitoringFilterModel(
        type: MonitoringTypeEnum.solar,
        date: DateHelper.getDateOnly(DateTime.now())!,
        isKiloWall: false,
        forceUpdate: false,
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
          // monitoringBloc = MonitoringMockedBloc();
        },
      );

      tearDownAll(
        () {
          monitoringBloc.close();
        },
      );

      testWidgets(
        'initial state just check that the default date is today',
        (WidgetTester tester) async {
          // Stub the method to return mock data
          when(() => monitoringMockedRepository.getMonitoring(defaultFilter))
              .thenAnswer((_) async => mockedData);

// whenListen(bloc, stream)
          // when(() => monitoringMockedRepository
          //         .getMonitoring(defaultFilter.copyWith(forceUpdate: true)))
          //     .thenAnswer((_) async => mockedData);

          await tester.pumpWidget(const EnpalApp());

          // Verify the initial state
          expect(
            find.text(DateHelper.getDateOnly(DateTime.now())!),
            findsOneWidget,
          );

          monitoringBloc.add(BaseEventLoadMonitoring(defaultFilter));

          // await tester.pump(); // Wait for a single frame update
          // await tester
          //     .pumpAndSettle(); // Wait until all animations and async tasks are done
          // // // Add a delay
          // // await Future.delayed(const Duration(seconds: 2));
          // await tester.pumpAndSettle();
          // // await tester.pump(Duration(seconds: 2));

          // expectLater(
          //   monitoringBloc.stream,
          //   emitsInOrder(
          //     [
          //       const BaseStateProgress<MonitoringModel>(),
          //       const BaseStateProgressDismiss<MonitoringModel>(),
          //       BaseStateListLoadedSuccessfully<MonitoringModel>(
          //         data: mockedData,
          //       ),
          //     ],
          //   ),
          // );

          // expect(monitoringBloc.state, [
          //   BaseStateListLoadedSuccessfully<MonitoringModel>(data: mockedData),
          // ]);

          // // Verify the initial state
          // expect(
          //   find.text(BaseL10S.watts.tr),
          //   findsOneWidget,
          // );
        },
      );

      testWidgets(
        'increments the counter when increment button is tapped',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider.value(
                value: monitoringBloc,
                child: const HomePage(),
              ),
            ),
          );

          // Tap the increment button
          final switchButton = find.byType(SwitchListTile).first;
          await tester.tap(switchButton);

          //  expect(switchButton., findsOneWidget);
          // await tester.pump();

          // Verify the count is incremented
          // expect(find.text('Count: 1'), findsOneWidget);
        },
      );

/*
      testWidgets('increments the counter when increment button is tapped',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: monitoringBloc,
              child: const HomePage(),
            ),
          ),
        );

        // Tap the increment button
        final incrementButton = find.byKey(const Key('incrementButton'));
        await tester.tap(incrementButton);
        await tester.pump();

        // Verify the count is incremented
        expect(find.text('Count: 1'), findsOneWidget);
      });

      testWidgets('decrements the counter when decrement button is tapped',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: monitoringBloc,
              child: const HomePage(),
            ),
          ),
        );

        // Tap the decrement button
        final decrementButton = find.byKey(const Key('decrementButton'));
        await tester.tap(decrementButton);
        await tester.pump();

        // Verify the count is decremented
        expect(find.text('Count: -1'), findsOneWidget);
      });

      testWidgets('increments and decrements correctly in sequence',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: monitoringBloc,
              child: const HomePage(),
            ),
          ),
        );

        // Tap the increment button twice
        final incrementButton = find.byKey(const Key('incrementButton'));
        await tester.tap(incrementButton);
        await tester.tap(incrementButton);
        await tester.pump();

        // Verify the count is 2
        expect(find.text('Count: 2'), findsOneWidget);

        // Tap the decrement button
        final decrementButton = find.byKey(const Key('decrementButton'));
        await tester.tap(decrementButton);
        await tester.pump();

        // Verify the count is 1
        expect(find.text('Count: 1'), findsOneWidget);
      });
   */
    },
  );
}
