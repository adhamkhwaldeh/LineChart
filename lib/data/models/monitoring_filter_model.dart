import 'package:enpal_assignment/data/enums/monitoring_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_filter_model.freezed.dart';

@freezed
class MonitoringFilterModel with _$MonitoringFilterModel {
  const factory MonitoringFilterModel({
    required String date,
    required MonitoringTypeEnum type,
    required bool isKiloWall,
    required bool forceUpdate,
  }) = _MonitoringFilterModel;
}
