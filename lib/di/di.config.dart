// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:enpal_assignment/api_services/api_service.dart' as _i5;
import 'package:enpal_assignment/di/network_di.dart' as _i11;
import 'package:enpal_assignment/di/shared_preferences_di.dart' as _i10;
import 'package:enpal_assignment/repositories/cache_repository.dart' as _i8;
import 'package:enpal_assignment/repositories/general_repository.dart' as _i9;
import 'package:enpal_assignment/repositories/mocked/monitoring_mocked_repository.dart'
    as _i6;
import 'package:enpal_assignment/repositories/monitoring_repository.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesDi = _$SharedPreferencesDi();
    final networkDi = _$NetworkDi();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => sharedPreferencesDi.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => networkDi.dio());
    gh.lazySingleton<_i5.ApiService>(
        () => _i5.ApiService.create(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.MonitoringMockedRepository>(
        () => _i6.MonitoringMockedRepository());
    gh.lazySingleton<_i7.MonitoringRepository>(
        () => _i7.MonitoringRepository(gh<_i5.ApiService>()));
    gh.lazySingleton<_i8.CacheRepository>(
        () => _i8.CacheRepository(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i9.GeneralRepository>(
        () => _i9.GeneralRepository(gh<_i3.SharedPreferences>()));
    return this;
  }
}

class _$SharedPreferencesDi extends _i10.SharedPreferencesDi {}

class _$NetworkDi extends _i11.NetworkDi {}
