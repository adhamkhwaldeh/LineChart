import 'package:enpal_assignment/bloc/base_events/base_event.dart';
import 'package:enpal_assignment/bloc/monitoring_bloc.dart';
import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// I've separated this part to implement the polling
class LineGraphWidget extends HookWidget {
  final MonitoringBloc bloc;
  final List<MonitoringModel> data;
  final MonitoringFilterModel monitoringFilter;
  const LineGraphWidget({
    super.key,
    required this.bloc,
    required this.data,
    required this.monitoringFilter,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      bloc.add(BaseEventPollingForMonitoring(monitoringFilter));
      return () {
        //The existed time will be canceled as well
        bloc.dispose();
      };
    }, []);

    return SfCartesianChart(
      selectionType: SelectionType.series,
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        enablePinching: true,
        enableDoubleTapZooming: true,
        enableMouseWheelZooming: true,
        enableSelectionZooming: true,
        zoomMode: ZoomMode.x,
      ),
      primaryYAxis: NumericAxis(
        name: BaseL10S.watts.tr,
        title: AxisTitle(
          text:
              "${monitoringFilter.isKiloWall ? BaseL10S.kilo.tr : ""}${BaseL10S.watts.tr}",
          textStyle: Get.textTheme.labelSmall,
        ),
        labelStyle: Get.textTheme.labelSmall,
        // This name matches the yAxisName in the series)
      ),
      primaryXAxis: DateTimeAxis(
        name: BaseL10S.time.tr,
        autoScrollingMode: AutoScrollingMode.start,
        labelStyle: Get.textTheme.labelSmall,

        // autoScrollingDelta: 1,
        // desiredIntervals: 24,
        // enableAutoIntervalOnZooming: true,

        //The Default visible range
        autoScrollingDelta: 60 + 30,
        autoScrollingDeltaType: DateTimeIntervalType.minutes,

        //The Default division for chunks
        //While I've enabled the option for zooming I've kept it auto
        // interval: 5,
        // intervalType: DateTimeIntervalType.minutes,

        associatedAxisName: BaseL10S.time.tr,
        title: AxisTitle(
          text: BaseL10S.time.tr,
          textStyle: Get.textTheme.labelSmall,
        ),
        // This name matches the yAxisName in the series)
      ),
      series: [
        // Renders column chart
        // ColumnSeries<MonitoringModel, DateTime>(

        // Renders line chart
        FastLineSeries<MonitoringModel, DateTime>(
          dataSource: data,
          xValueMapper: (MonitoringModel monitoring, _) => monitoring.dateTime,
          yValueMapper: (MonitoringModel monitoring, _) =>
              monitoringFilter.isKiloWall
                  ? monitoring.valueInKiloWatt
                  : monitoring.value,
          // width: 0.8, // Width of the columns
          // spacing: 0.2, // Spacing between the columns
          xAxisName: BaseL10S.time.tr,
          yAxisName: BaseL10S.watts.tr,
          dataLabelMapper: (datum, index) {
            return datum.time2View;
          },

          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(
          //     DimensionsHelper.cardRadiusSm,
          //   ),
          //   topRight: Radius.circular(
          //     DimensionsHelper.cardRadiusSm,
          //   ),
          // ),
        ),
      ],
    );
  }
}
