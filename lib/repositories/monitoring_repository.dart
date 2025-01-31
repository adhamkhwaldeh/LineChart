import 'package:enpal_assignment/api_services/api_service.dart';
import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:enpal_assignment/repositories/imonitoring_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MonitoringRepository extends IMonitoringRepository {
  final ApiService apiInterface;
  MonitoringRepository(
    this.apiInterface,
  );

  @override
  Future<List<MonitoringModel>> getMonitoring(MonitoringFilterModel filter) =>
      apiInterface.getMonitoring(
        date: filter.date,
        type: filter.type.name,
      );
}
