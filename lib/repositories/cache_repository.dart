import 'dart:convert';
import 'package:enpal_assignment/data/models/monitoring_filter_model.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

@lazySingleton
class CacheRepository {
  final SharedPreferences sharedPreferences;

  static const String monitoringTag = "Monitoring_Tag";

  CacheRepository(
    this.sharedPreferences,
  );

  String generateCodeWithFilter(
    MonitoringFilterModel filterModel,
  ) {
    return monitoringTag + filterModel.type.name + filterModel.date;
  }

  setMonitoring(
    MonitoringFilterModel filterModel,
    List<MonitoringModel> monitoringList,
  ) async {
    await sharedPreferences.setString(
      generateCodeWithFilter(filterModel),
      json.encode(monitoringList),
    );
  }

  Future<List<MonitoringModel>?> getMonitoring(
    MonitoringFilterModel filterModel,
  ) async {
    String? monitoringList = sharedPreferences.getString(
      generateCodeWithFilter(filterModel),
    );

    if (monitoringList.isNotEmptyAndNotNull) {
      List result = jsonDecode(monitoringList!);
      return result.map((e) => MonitoringModel.fromJson(e)).toList();
    }
    return null;
  }
}
