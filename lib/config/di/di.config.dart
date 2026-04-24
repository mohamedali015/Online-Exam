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

import '../../features/auth/api/api_client_auth.dart' as _i519;
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
import '../../features/exam/api/data_sources/remote/exam_remote_data_source_impl.dart'
    as _i157;
import '../../features/exam/api/exam_api_client/exam_api_client.dart' as _i665;
import '../../features/exam/data/data_sources/remote/exam_remote_data_source.dart'
    as _i4;
import '../../features/exam/data/repositories/exam_repo_impl.dart' as _i1047;
import '../../features/exam/domain/repositories/exam_repo.dart' as _i377;
import '../../features/exam/domain/use_cases/get_exam_questions_use_case.dart'
    as _i55;
import '../../features/exam/presentation/manager/exam_cubit.dart' as _i689;
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
import '../../features/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart'
    as _i987;
import '../../features/home/api/all_subjects_api_client/all_subjects_api_client.dart'
    as _i194;
import '../../features/home/api/data_source/remote/get_all_subjects_remote_data_source_impl.dart'
    as _i888;
import '../../features/home/data/data_source/get_all_subjects_remote_data_source.dart'
    as _i990;
import '../../features/home/data/repositories/get_all_subjects_repo_impl.dart'
    as _i822;
import '../../features/home/domain/repositories/get_all_subjects_repo.dart'
    as _i408;
import '../../features/home/domain/use_case/get_all_subjects_use_case.dart'
    as _i17;
import '../../features/home/presentation/manager/all_subjects_cubit.dart'
    as _i362;
import '../../features/profile/api/data_sources/remote/profile_remote_data_source_impl.dart'
    as _i19;
import '../../features/profile/api/profile_api_client/profile_api_client.dart'
    as _i1000;
import '../../features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i683;
import '../../features/profile/data/repositories/profile_repo_impl.dart'
    as _i988;
import '../../features/profile/domain/repositories/profile_repo.dart' as _i790;
import '../../features/profile/domain/use_cases/profile_use_case.dart' as _i802;
import '../../features/profile/presentation/manager/update_profile/update_profile_cubit.dart'
    as _i357;
import '../module/api_module.dart' as _i235;
import '../user/api/data_sources/remote/user_remote_data_source_impl.dart'
    as _i694;
import '../user/api/user_api_client/user_api_client.dart' as _i1062;
import '../user/data/data_sources/remote/user_remote_data_source.dart' as _i806;
import '../user/data/repositories/user_repo_impl.dart' as _i419;
import '../user/domain/repositories/user_repo.dart' as _i632;
import '../user/domain/use_cases/get_user_data_use_case.dart' as _i180;
import '../user/manager/user_cubit.dart' as _i720;

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
    gh.lazySingleton<_i194.AllSubjectsApiClient>(
      () => _i194.AllSubjectsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1062.UserApiClient>(
      () => _i1062.UserApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i519.ApiClientAuth>(() => _i519.ApiClientAuth(gh<_i361.Dio>()));
    gh.factory<_i665.ExamApiClient>(() => _i665.ExamApiClient(gh<_i361.Dio>()));
    gh.factory<_i104.ExamsApiClient>(
      () => _i104.ExamsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i301.ForgetPasswordApiClient>(
      () => _i301.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1000.ProfileApiClient>(
      () => _i1000.ProfileApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i586.ExamsRemoteDataSource>(
      () => _i895.ExamsRemoteDataSourceImpl(gh<_i104.ExamsApiClient>()),
    );
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i321.AuthRemoteDataSourceImpl(gh<_i519.ApiClientAuth>()),
    );
    gh.factory<_i683.ProfileRemoteDataSource>(
      () => _i19.ProfileRemoteDataSourceImpl(gh<_i1000.ProfileApiClient>()),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i662.AuthRepoImpl(gh<_i548.AuthRemoteDataSource>()),
    );
    gh.factory<_i881.ForgetPasswordRemoteDataSource>(
      () => _i973.ForgetPasswordRemoteDataSourceImpl(
        gh<_i301.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i806.UserRemoteDataSource>(
      () => _i694.UserRemoteDataSourceImpl(gh<_i1062.UserApiClient>()),
    );
    gh.factory<_i926.ExamsRepo>(
      () => _i52.ExamsRepoImpl(gh<_i586.ExamsRemoteDataSource>()),
    );
    gh.lazySingleton<_i990.GetAllSubjectsDataSource>(
      () => _i888.GetAllSubjectsRemoteDataSourceImpl(
        gh<_i194.AllSubjectsApiClient>(),
      ),
    );
    gh.factory<_i4.ExamRemoteDataSource>(
      () => _i157.ExamRemoteDataSourceImpl(gh<_i665.ExamApiClient>()),
    );
    gh.factory<_i184.ForgetPasswordRepo>(
      () => _i732.ForgetPasswordRepoImpl(
        gh<_i881.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i377.ExamRepo>(
      () => _i1047.ExamRepoImpl(gh<_i4.ExamRemoteDataSource>()),
    );
    gh.factory<_i973.LoginUseCase>(
      () => _i973.LoginUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i408.SubjectsRepository>(
      () => _i822.SubjectsRepositoryImpl(gh<_i990.GetAllSubjectsDataSource>()),
    );
    gh.factory<_i854.GetExamsUseCase>(
      () => _i854.GetExamsUseCase(gh<_i926.ExamsRepo>()),
    );
    gh.factory<_i790.ProfileRepo>(
      () => _i988.ProfileRepoImpl(gh<_i683.ProfileRemoteDataSource>()),
    );
    gh.factory<_i463.RegisterUseCase>(
      () => _i463.RegisterUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i55.GetExamQuestionsUseCase>(
      () => _i55.GetExamQuestionsUseCase(gh<_i377.ExamRepo>()),
    );
    gh.factory<_i632.UserRepo>(
      () => _i419.UserRepoImpl(gh<_i806.UserRemoteDataSource>()),
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
    gh.factory<_i180.GetUserDataUseCase>(
      () => _i180.GetUserDataUseCase(gh<_i632.UserRepo>()),
    );
    gh.factory<_i1022.RegisterCubit>(
      () => _i1022.RegisterCubit(gh<_i463.RegisterUseCase>()),
    );
    gh.factory<_i802.ProfileUseCase>(
      () => _i802.ProfileUseCase(gh<_i790.ProfileRepo>()),
    );
    gh.factory<_i893.ExamsCubit>(
      () => _i893.ExamsCubit(gh<_i854.GetExamsUseCase>()),
    );
    gh.factory<_i17.GetAllSubjectsUseCase>(
      () => _i17.GetAllSubjectsUseCase(gh<_i408.SubjectsRepository>()),
    );
    gh.factory<_i689.ExamCubit>(
      () => _i689.ExamCubit(
        getExamQuestionsUseCase: gh<_i55.GetExamQuestionsUseCase>(),
      ),
    );
    gh.factory<_i987.ForgetPasswordCubit>(
      () => _i987.ForgetPasswordCubit(
        gh<_i382.EnterEmailUseCase>(),
        gh<_i252.VerifyOtpForgetPasswordUseCase>(),
        gh<_i696.GetNewPasswordForgetPasswordUseCase>(),
      ),
    );
    gh.lazySingleton<_i720.UserCubit>(
      () => _i720.UserCubit(gh<_i180.GetUserDataUseCase>()),
    );
    gh.factory<_i357.UpdateProfileCubit>(
      () => _i357.UpdateProfileCubit(gh<_i802.ProfileUseCase>()),
    );
    gh.factory<_i362.SubjectsCubit>(
      () => _i362.SubjectsCubit(gh<_i17.GetAllSubjectsUseCase>()),
    );
    return this;
  }
}

class _$ApiModule extends _i235.ApiModule {}
