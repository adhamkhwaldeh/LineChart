import 'package:flutter/foundation.dart' as foundation;

class Env {
  static late EnvData _env;

  static EnvData get data => _env;

  static const bool isRelease = foundation.kReleaseMode;

  static const bool isDebug = !foundation.kReleaseMode;

  static void init() {
    _env = isRelease ? Env.prod : Env.dev;
  }

  static final EnvData dev = EnvData(
    debug: true,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: true,
    // apiBaseUrl: ApiConfiguration.propertyManBaseUrl,
    // apiBaseUrl: "http://localhost:3000/",
    apiBaseUrl: "http://192.168.70.237:3000/",
  );

  static final EnvData prod = EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: false,
    // apiBaseUrl: ApiConfiguration.propertyManBaseUrl,
    // apiBaseUrl: "http://localhost:3000/",
    apiBaseUrl: "http://192.168.70.237:3000/",
  );
}

class EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;
  final String apiBaseUrl;

  EnvData({
    required this.debug,
    required this.debugShowCheckedModeBanner,
    required this.debugShowMaterialGrid,
    required this.debugApiClient,
    required this.apiBaseUrl,
  });
}
