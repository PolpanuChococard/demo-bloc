// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/authentication/data/repositories/auth_repository_impl.dart'
    as _i441;
import '../../../features/authentication/domain/repositories/auth_repository.dart'
    as _i20;
import '../../../features/authentication/domain/use_cases/get_current_auth_use_case.dart'
    as _i716;
import '../../../features/authentication/domain/use_cases/log_in_use_case.dart'
    as _i741;
import '../../../features/authentication/domain/use_cases/refresh_token_use_case.dart'
    as _i152;
import '../../../features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart'
    as _i215;
import '../../../features/authentication/presentation/bloc/login_bloc/login_bloc.dart'
    as _i224;
import '../../../features/home/data/repositories/products_repository_impl.dart'
    as _i844;
import '../../../features/home/domain/repositories/products_repository.dart'
    as _i436;
import '../../../features/home/domain/use_cases/get_products_use_case.dart'
    as _i631;
import '../../../features/home/presentation/bloc/products_bloc/products_bloc.dart'
    as _i488;
import '../../app_config/api_services.dart' as _i20;
import '../../app_config/dio_config.dart' as _i560;
import '../../app_config/interceptor.dart' as _i711;
import '../secure_storage.dart' as _i803;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i224.LoginBloc>(() => _i224.LoginBloc());
    gh.singleton<_i803.SecureStorage>(() => _i803.SecureStorage());
    gh.lazySingleton<_i560.DioConfig>(() => _i560.DioConfig());
    gh.factory<_i711.DemoInterceptor>(
        () => _i711.DemoInterceptor(secureStorage: gh<_i803.SecureStorage>()));
    gh.singleton<_i20.ApiService>(
        () => _i20.ApiService(dio: gh<_i560.DioConfig>()));
    gh.factory<_i436.ProductsRepository>(
        () => _i844.ProductsRepositoryImpl(apiService: gh<_i20.ApiService>()));
    gh.factory<_i20.AuthRepository>(
        () => _i441.AuthRepositoryImpl(apiService: gh<_i20.ApiService>()));
    gh.factory<_i631.GetProductsUseCase>(
        () => _i631.GetProductsUseCase(gh<_i436.ProductsRepository>()));
    gh.factory<_i716.GetCurrentAuthUseCase>(
        () => _i716.GetCurrentAuthUseCase(gh<_i20.AuthRepository>()));
    gh.factory<_i741.LogInUseCase>(
        () => _i741.LogInUseCase(gh<_i20.AuthRepository>()));
    gh.factory<_i152.RefreshTokenUseCase>(
        () => _i152.RefreshTokenUseCase(gh<_i20.AuthRepository>()));
    gh.factory<_i488.ProductsBloc>(() =>
        _i488.ProductsBloc(getProductsUseCase: gh<_i631.GetProductsUseCase>()));
    gh.factory<_i215.AuthenticationBloc>(() => _i215.AuthenticationBloc(
          logInUseCase: gh<_i741.LogInUseCase>(),
          secureStorage: gh<_i803.SecureStorage>(),
          getCurrentAuthUseCase: gh<_i716.GetCurrentAuthUseCase>(),
        ));
    return this;
  }
}
