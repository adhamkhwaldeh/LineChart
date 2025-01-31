import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_event.freezed.dart';

@freezed
sealed class BaseEvent with _$BaseEvent {
  const factory BaseEvent.loadMonitoring(MonitoringFilterModel filter) =
      BaseEventLoadMonitoring;

  const factory BaseEvent.pollingForMonitoring(MonitoringFilterModel filter) =
      BaseEventPollingForMonitoring;

  const factory BaseEvent.loadRemoteMonitoringOnly(
      MonitoringFilterModel filter) = BaseEventLoadRemoteMonitoringOnly;
}
