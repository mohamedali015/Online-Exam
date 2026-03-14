import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/features/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:online_exam/features/forget_password/presentation/pages/forget_password_enter_email_view.dart';
import 'package:online_exam/features/forget_password/presentation/pages/forget_password_verify_otp_view.dart';

import '../../domain/use_cases/enter_email_forget_password_use_case.dart';
import '../../domain/use_cases/get_new_password_forget_password_use_case.dart';
import '../../domain/use_cases/verify_otp_forget_password_use_case.dart';
import '../pages/forget_password_new_password_view.dart';

class ForgetPasswordFlow extends StatelessWidget {
  const ForgetPasswordFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        getIt<EnterEmailUseCase>(),
        getIt<VerifyOtpForgetPasswordUseCase>(),
        getIt<GetNewPasswordForgetPasswordUseCase>(),
      ),
      child: Navigator(
        initialRoute: Routes.forgetPasswordEnterEmailViewRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.forgetPasswordEnterEmailViewRoute:
              return MaterialPageRoute(
                builder: (_) => const ForgetPasswordEnterEmailView(),
                settings: settings,
              );

            case Routes.forgetPasswordOtpViewRoute:
              return MaterialPageRoute(
                builder: (_) => const ForgetPasswordVerifyOtpView(),
                settings: settings,
              );

            case Routes.forgetPasswordNewPassViewRoute:
              return MaterialPageRoute(
                builder: (_) => const ForgetPasswordNewPasswordView(),
                settings: settings,
              );

            default:
              return _errorRoute();
          }
        },
      ),
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(
            'Page Not Found Flow Forget Password',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
