import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:enpal_assignment/helpers/json_helper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiMockedService {
  Future<List<MonitoringModel>> getMonitoring({
    required String date,
    required String type,
  }) async {
    List result = await JsonHelper.readJson('assets/monitoring_sample.json');
    return result.map((e) => MonitoringModel.fromJson(e)).toList();
  }
}
