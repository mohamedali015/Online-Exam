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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/api/api_client.dart' as _i645;
import '../../features/auth/api/data_source/remote/auth_remote_data_source_impl.dart'
    as _i321;
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/register_use_case.dart' as _i463;
import '../../features/auth/presention/manager/login/login_cubit.dart' as _i219;
import '../../features/auth/presention/manager/register/register_cubit.dart'
    as _i1022;
import '../../features/exams/api/data_source/exams_remote_data_source_impl.dart'
    as _i895;
import '../../features/exams/api/exams_api_client.dart' as _i104;
import '../../features/exams/data/data_source/exams_remote_data_source.dart'
    as _i586;
import '../../features/exams/data/repositories/exam_repo_impl.dart' as _i52;
import '../../features/exams/domain/repositories/exams_repo.dart' as _i926;
import '../../features/exams/domain/use_cases/get_exams_use_case.dart' as _i854;
import '../../features/exams/presentation/manager/exams_cubit/exams_cubit.dart'
    as _i893;
import '../../features/forget_password/api/data_sources/remote/forget_password_remote_data_source_impl.dart'
    as _i973;
import '../../features/forget_password/api/forget_password_api_client/forget_password_api_client.dart'
    as _i301;
import '../../features/forget_password/data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i881;
import '../../features/forget_password/data/repositories/forget_password_repo_impl.dart'
    as _i732;
import '../../features/forget_password/domain/repositories/forget_password_repo.dart'
    as _i184;
import '../../features/forget_password/domain/use_cases/enter_email_forget_password_use_case.dart'
    as _i382;
import '../../features/forget_password/domain/use_cases/get_new_password_forget_password_use_case.dart'
    as _i696;
import '../../features/forget_password/domain/use_cases/verify_otp_forget_password_use_case.dart'
    as _i252;
import '../../features/forget_password/presentation/manager/forget_password_enter_email_cubit/forget_password_enter_email_cubit.dart'
    as _i653;
import '../../features/forget_password/presentation/manager/forget_password_otp_cubit/forget_password_otp_cubit.dart'
    as _i727;
import '../module/api_module.dart' as _i235;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.lazySingleton<_i361.BaseOptions>(() => apiModule.providerOption());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => apiModule.providerDioLogger(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.lazySingleton<_i645.ApiClient>(
      () => apiModule.provideApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i104.ExamsApiClient>(
      () => _i104.ExamsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i301.ForgetPasswordApiClient>(
      () => _i301.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i321.AuthRemoteDataSourceImpl(gh<_i645.ApiClient>()),
    );
    gh.factory<_i586.ExamsRemoteDataSource>(
      () => _i895.ExamsRemoteDataSourceImpl(gh<_i104.ExamsApiClient>()),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i662.AuthRepoImpl(gh<_i548.AuthRemoteDataSource>()),
    );
    gh.factory<_i881.ForgetPasswordRemoteDataSource>(
      () => _i973.ForgetPasswordRemoteDataSourceImpl(
        gh<_i301.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i926.ExamsRepo>(
      () => _i52.ExamsRepoImpl(gh<_i586.ExamsRemoteDataSource>()),
    );
    gh.factory<_i184.ForgetPasswordRepo>(
      () => _i732.ForgetPasswordRepoImpl(
        gh<_i881.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i973.LoginUseCase>(
      () => _i973.LoginUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i854.GetExamsUseCase>(
      () => _i854.GetExamsUseCase(gh<_i926.ExamsRepo>()),
    );
    gh.factory<_i463.RegisterUseCase>(
      () => _i463.RegisterUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i219.LoginCubit>(
      () => _i219.LoginCubit(gh<_i973.LoginUseCase>()),
    );
    gh.factory<_i382.EnterEmailUseCase>(
      () => _i382.EnterEmailUseCase(gh<_i184.ForgetPasswordRepo>()),
    );
    gh.factory<_i696.GetNewPasswordForgetPasswordUseCase>(
      () => _i696.GetNewPasswordForgetPasswordUseCase(
        gh<_i184.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i252.VerifyOtpForgetPasswordUseCase>(
      () =>
          _i252.VerifyOtpForgetPasswordUseCase(gh<_i184.ForgetPasswordRepo>()),
    );
    gh.factory<_i1022.RegisterCubit>(
      () => _i1022.RegisterCubit(gh<_i463.RegisterUseCase>()),
    );
    gh.factory<_i893.ExamsCubit>(
      () => _i893.ExamsCubit(gh<_i854.GetExamsUseCase>()),
    );
    gh.factory<_i727.ForgetPasswordOtpCubit>(
      () => _i727.ForgetPasswordOtpCubit(
        gh<_i252.VerifyOtpForgetPasswordUseCase>(),
      ),
    );
    gh.factory<_i653.ForgetPasswordEnterEmailCubit>(
      () => _i653.ForgetPasswordEnterEmailCubit(gh<_i382.EnterEmailUseCase>()),
    );
    return this;
  }
}

class _$ApiModule extends _i235.ApiModule {}
