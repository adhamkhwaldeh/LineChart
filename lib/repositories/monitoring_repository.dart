import 'package:enpal_assignment/api_services/api_mocked_service.dart';
import 'package:enpal_assignment/api_services/api_service.dart';
import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:enpal_assignment/di/env.dart';
import 'package:enpal_assignment/repositories/imonitoring_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MonitoringRepository extends IMonitoringRepository {
  final ApiService apiInterface;
  final ApiMockedService apiMockedService;
  MonitoringRepository(
    this.apiInterface,
    this.apiMockedService,
  );

  @override
  Future<List<MonitoringModel>> getMonitoring(MonitoringFilterModel filter) {
    if (Env.data.useMockedApi) {
      return apiMockedService.getMonitoring(
        date: filter.date,
        type: filter.type.name,
      );
    } else {
      return apiInterface.getMonitoring(
        date: filter.date,
        type: filter.type.name,
      );
    }
  }
}
