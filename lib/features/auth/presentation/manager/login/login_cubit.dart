import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/presentation/manager/login/login_state.dart';
import '../../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../../domain/use_case/login_use_case.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  bool isRememberMe = false;

  void changeRememberMe(bool value) {
    isRememberMe = value;
    emit(LoginInitialState());
  }

  void loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final result = await _loginUseCase.call(
      email: email,
      password: password,
    );

    switch (result) {
      case Success():
        {
          final token = result.data.token;

          if (isRememberMe && token != null) {
            await SecureCacheHelper.saveData(
              key: CacheKeys.token,
              value: token,
            );
          }

          emit(LoginSuccessState(result.data));
        }

      case Failure():
        {
          emit(LoginFailureState(result.errorMessage));
        }
    }
  }
}