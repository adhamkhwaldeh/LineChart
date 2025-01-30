import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:enpal_assignment/di/env.dart';

@module
abstract class NetworkDi {
  @lazySingleton
  // @Named('Dio')
  Dio dio() {
    Dio dio = Dio();

    dio.options.connectTimeout = const Duration(seconds: 10);
    
    //We can add any Interceptor here
    // dio.interceptors.add(DioHeaderInterceptors());

    if (Env.data.debugApiClient) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          queryParameters: true,
          showProcessingTime: true,
          canShowLog: true,
          // logPrint: true,
          // compact: true,
        ),
      );
    }

    return dio;
  }
}
