import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';

abstract class IMonitoringRepository {
  Future<List<MonitoringModel>> getMonitoring(MonitoringFilterModel filter);
}
