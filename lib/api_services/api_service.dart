import 'dart:async';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://192.168.70.237:3000/")
@lazySingleton
abstract class ApiService {
  static late Dio globalDio;

  @factoryMethod
  static ApiService create(Dio dio) {
    var retrofit = ApiService(dio);
    globalDio = dio;
    // dio.interceptors.add(PrettyDioLogger.initialTab)
    return retrofit;
  }

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("monitoring")
  Future<List<MonitoringModel>> getMonitoring({
    @Query("date") required String date,
    @Query("type") required String type,
  });
}
