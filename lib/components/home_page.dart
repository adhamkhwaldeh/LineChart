import 'package:enpal_assignment/bloc/base_events/base_event.dart';
import 'package:enpal_assignment/bloc/base_states/base_state.dart';
import 'package:enpal_assignment/bloc/monitoring_bloc.dart';
import 'package:enpal_assignment/components/line_graph_widget.dart';
import 'package:enpal_assignment/data/enums/monitoring_type_enum.dart';
import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:enpal_assignment/di/di.dart';
import 'package:enpal_assignment/dialogs/change_language_dialog.dart';
import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:enpal_assignment/helpers/date_helper.dart';
import 'package:enpal_assignment/repositories/cache_repository.dart';
import 'package:enpal_assignment/repositories/general_repository.dart';
import 'package:enpal_assignment/repositories/monitoring_repository.dart';
import 'package:enpal_assignment/widgets/date_time_filter.dart';
import 'package:enpal_assignment/widgets/state_widgets/internal_server_error_layout.dart';
import 'package:enpal_assignment/widgets/state_widgets/no_data_layout.dart';
import 'package:enpal_assignment/widgets/state_widgets/no_internet_connection_layout.dart';
import 'package:enpal_assignment/widgets/state_widgets/not_authorized_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);

    // To save current language and theme
    var generalRepository = useMemoized(() => getIt<GeneralRepository>());

    // We are not using dependencies for Bloc to avoid creating shared same state and instance within  different screens
    final bloc = useMemoized(
      () => MonitoringBloc(
        // UnitTestHelper.isUnitTest()
        //     ? getIt<MonitoringMockedRepository>()
        //     : 
            getIt<MonitoringRepository>(),
        getIt<CacheRepository>(),
      ),
    );

    // I'm just persisting the criteria for filtration
    // While we have limited options for filtration I'm just using useState
    // For more complex scenarios I would love to user ChangeNotifier provider with HookConsumerWidget (rely on riverpod)
    var monitoringFilter = useState(
      MonitoringFilterModel(
        date: DateHelper.getDateOnly(DateTime.now())!,
        type: MonitoringTypeEnum.solar,
        isKiloWall: false,
        forceUpdate: false,
      ),
    );

    // This function is being called first time and upon updating monitoringFilter
    useEffect(() {
      bloc.add(BaseEventLoadMonitoring(monitoringFilter.value));
      return null;
    }, [monitoringFilter.value]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.appBarTheme.backgroundColor,
        leading: IconButton(
          icon: Icon((generalRepository.isDarkTheme() ?? false)
              ? Icons.light_mode
              : Icons.dark_mode),
          onPressed: () async {
            var currentTheme = (generalRepository.isDarkTheme() ?? false);
            generalRepository.setDarkTheme(!currentTheme);
            Get.changeThemeMode(
              currentTheme ? ThemeMode.light : ThemeMode.dark,
            );
            Get.appUpdate();
            await Get.forceAppUpdate();
            Future.delayed(const Duration(milliseconds: 2000), () async {
              Get.back();
              Phoenix.rebirth(Get.context!);
              // Phoenix.rebirth(Get.context!);
            });
          },
        ),
        title: Text(BaseL10S.enpalApp.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Get.defaultDialog(
                title: BaseL10S.changeLanguage.tr,
                content: ChangeLanguageDialog(
                  onLocaleChange: (localeCode) {
                    generalRepository.settLocaleCode(localeCode);
                    Get.updateLocale(Locale(localeCode));
                    // Phoenix.rebirth(context);
                  },
                ),
                backgroundColor: Get.theme.cardColor,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              bloc.add(
                BaseEventLoadMonitoring(
                  monitoringFilter.value.copyWith(forceUpdate: true),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
            controller: tabController,
            // I've stopped the scroll here because the inner graph already has horizontal scroll
            physics: const NeverScrollableScrollPhysics(),
            // labelColor: Colors.black,
            // unselectedLabelColor: Colors.black,
            isScrollable: false,
            indicatorColor: Get.theme.colorScheme.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (index) {
              tabController.animateTo(index);
              monitoringFilter.value = monitoringFilter.value
                  .copyWith(type: MonitoringTypeEnum.values[index]);
            },
            tabs: [
              Tab(text: BaseL10S.solar.tr),
              Tab(text: BaseL10S.house.tr),
              Tab(text: BaseL10S.battery.tr),
            ],
          ).backgroundColor(Get.theme.primaryColor),
          Row(
            children: [
              DateTimeFilter(
                dateTime: monitoringFilter.value.date,
                onChanged: (value) {
                  monitoringFilter.value = monitoringFilter.value.copyWith(
                    date: DateHelper.getDateOnly(value!)!,
                  );
                },
              ).expand(),
              SwitchListTile.adaptive(
                title: Text(
                  BaseL10S.kiloWatt.tr,
                  style: Get.textTheme.labelMedium,
                ),
                value: monitoringFilter.value.isKiloWall,
                onChanged: (value) {
                  monitoringFilter.value =
                      monitoringFilter.value.copyWith(isKiloWall: value);
                },
              ).flexible(),
            ],
          ).backgroundColor(Get.theme.cardColor),
          BlocBuilder<MonitoringBloc, BaseState<MonitoringModel>>(
            bloc: bloc,
            builder: (context, state) {
              return state.maybeWhen(
                progress: () {
                  return const CircularProgressIndicator.adaptive().centered();
                },
                noDataFound: () {
                  return const NoDataLayout().centered();
                },
                noInternetConnection: () {
                  return NotInternetConnectionLayout(
                    reTry: () {
                      bloc.add(BaseEventLoadMonitoring(monitoringFilter.value));
                    },
                  ).centered();
                },
                internalServerError: (String error) {
                  return const InternalServerErrorLayout();
                },
                failure: (String error) {
                  return const InternalServerErrorLayout();
                },
                notAuthorize: (String error) {
                  return NotAuthorizedLayout(
                    requestAuthorization: () {
                      bloc.add(BaseEventLoadMonitoring(monitoringFilter.value));
                    },
                  );
                },
                listLoadedSuccessfully: (List<dynamic> data) {
                  return LineGraphWidget(
                    bloc: bloc,
                    data: data as List<MonitoringModel>,
                    monitoringFilter: monitoringFilter.value,
                  );
                },
                orElse: () {
                  return Container();
                },
              );
            },
          ).backgroundColor(Get.theme.cardColor).expand(),
        ],
      ),
      /*
      body: Scaffold(
        appBar: TabBar(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          isScrollable: false,
          indicatorColor: Get.theme.colorScheme.secondary,
          indicatorSize: TabBarIndicatorSize.label,
          onTap: (index) {
            tabController.animateTo(index);
          },
          tabs: [
            Tab(text: BaseL10S.Inbox.tr),
            Tab(text: BaseL10S.Messages.tr),
          ],
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            MetricsPage(MonitoringTypeEnum.solar),
            MetricsPage(MonitoringTypeEnum.house),
            MetricsPage(MonitoringTypeEnum.battery),
          ],
        ),
      ),
      */
    );
  }
}
