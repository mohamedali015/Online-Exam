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
  ForgetPasswordFlow({super.key});

  final GlobalKey<NavigatorState> flowNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        getIt<EnterEmailUseCase>(),
        getIt<VerifyOtpForgetPasswordUseCase>(),
        getIt<GetNewPasswordForgetPasswordUseCase>(),
      ),
      child: Navigator(
        key: flowNavigatorKey,
        initialRoute: Routes.forgetPasswordEnterEmailViewRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.forgetPasswordEnterEmailViewRoute:
              return MaterialPageRoute(
                builder: (_) => const ForgetPasswordEnterEmailView(),
              );

            case Routes.forgetPasswordOtpViewRoute:
              return MaterialPageRoute(
                builder: (_) => const ForgetPasswordVerifyOtpView(),
              );

            case Routes.forgetPasswordNewPassViewRoute:
              return MaterialPageRoute(
                builder: (_) => const ForgetPasswordNewPasswordView(),
              );
          }
        },
      ),
    );
  }
}
