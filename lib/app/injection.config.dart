// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/util/network_cubit.dart' as _i185;
import 'injection.dart' as _i464;
import 'repository/tmdb_repository.dart' as _i721;
import 'repository/tmdb_repository_impl.dart' as _i247;
import 'screen/home/home_cubit.dart' as _i955;
import 'service/api_service.dart' as _i942;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i185.NetworkCubit>(() => _i185.NetworkCubit());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i942.ApiService>(
      () => _i942.ApiService(dio: gh<_i361.Dio>()),
    );
    gh.singleton<_i247.TmdbRepositoryImpl>(
      () => _i247.TmdbRepositoryImpl(gh<_i942.ApiService>()),
    );
    gh.factory<_i955.HomeCubit>(
      () => _i955.HomeCubit(gh<_i721.TmdbRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
