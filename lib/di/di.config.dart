// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:enpal_assignment/api_services/api_mocked_service.dart' as _i667;
import 'package:enpal_assignment/api_services/api_service.dart' as _i242;
import 'package:enpal_assignment/di/network_di.dart' as _i305;
import 'package:enpal_assignment/di/shared_preferences_di.dart' as _i892;
import 'package:enpal_assignment/repositories/cache_repository.dart' as _i957;
import 'package:enpal_assignment/repositories/general_repository.dart' as _i755;
import 'package:enpal_assignment/repositories/mocked/monitoring_mocked_repository.dart'
    as _i714;
import 'package:enpal_assignment/repositories/monitoring_repository.dart'
    as _i953;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesDi = _$SharedPreferencesDi();
    final networkDi = _$NetworkDi();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesDi.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => networkDi.dio());
    gh.lazySingleton<_i714.MonitoringMockedRepository>(
        () => _i714.MonitoringMockedRepository());
    gh.lazySingleton<_i667.ApiMockedService>(() => _i667.ApiMockedService());
    gh.lazySingleton<_i242.ApiService>(
        () => _i242.ApiService.create(gh<_i361.Dio>()));
    gh.lazySingleton<_i957.CacheRepository>(
        () => _i957.CacheRepository(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i755.GeneralRepository>(
        () => _i755.GeneralRepository(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i953.MonitoringRepository>(
        () => _i953.MonitoringRepository(
              gh<_i242.ApiService>(),
              gh<_i667.ApiMockedService>(),
            ));
    return this;
  }
}

class _$SharedPreferencesDi extends _i892.SharedPreferencesDi {}

class _$NetworkDi extends _i305.NetworkDi {}
