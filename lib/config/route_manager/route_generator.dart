import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/features/auth/presention/pages/register/register_screen.dart';

import '../../core/shared_widgets/custom_bottom_nav.dart';
import '../../core/values/app_strings.dart';
import '../../features/auth/presention/manager/login/login_cubit.dart';
import '../../features/auth/presention/pages/login/login_screen.dart';
import '../../features/exams/presentation/pages/exams_screen.dart';
import '../../features/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import '../../features/forget_password/presentation/pages/forget_password_enter_email_view.dart';
import '../../features/forget_password/presentation/pages/forget_password_new_password_view.dart';
import '../../features/forget_password/presentation/pages/forget_password_verify_otp_view.dart';
import '../../features/home/domain/entities/get_all_subjects_entity.dart';
import '../../features/home/presentation/manager/all_subjects_cubit.dart';
import '../../features/home/presentation/manager/all_subjects_event.dart';
import '../../features/splash/splash_screen.dart';
import '../di/di.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
      /// Splash Screen
        case Routes.splashRoute:
          return CupertinoPageRoute(builder: (_) => const SplashScreen());

      /// Login Screen
        case Routes.loginRoute:
          return CupertinoPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => getIt.get<LoginCubit>(),
                  child: LoginScreen(),
                ),
          );
          // case Routes.homeRoute:
          // return CupertinoPageRoute(builder: (_) => HomeScreen(),);

          return CupertinoPageRoute(builder: (_) => LoginScreen());

      /// Register Screen
        case Routes.registerRoute:
          return CupertinoPageRoute(builder: (_) => RegisterScreen());

        case Routes.forgetPasswordEnterEmailViewRoute:
          return CupertinoPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (_) => getIt<ForgetPasswordCubit>(),
                  child: const ForgetPasswordEnterEmailView(),
                ),
          );

        case Routes.forgetPasswordOtpViewRoute:
          final cubit = settings.arguments as ForgetPasswordCubit;

          return CupertinoPageRoute(
            builder: (_) =>
                BlocProvider.value(
                  value: cubit,
                  child: const ForgetPasswordVerifyOtpView(),
                ),
          );

        case Routes.forgetPasswordNewPassViewRoute:
          final cubit = settings.arguments as ForgetPasswordCubit;

          return CupertinoPageRoute(
            builder: (_) =>
                BlocProvider.value(
                  value: cubit,
                  child: const ForgetPasswordNewPasswordView(),
                ),
          );

        case Routes.homeRoute:
          return CupertinoPageRoute(builder: (_) =>
              BlocProvider(
                create: (context) =>
                getIt.get<SubjectsCubit>()
                  ..doEvent(GetAllSubjectsEvent()),
                child: CustomBottomNavBar(),
              ));
        case Routes.examsRoute:
          SubjectEntity item = settings.arguments as SubjectEntity;

          return CupertinoPageRoute(builder: (_) => ExamsScreen(item: item));

      /// Default (Unknown Route)
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRouteWithMessage(e.toString());
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(AppStrings.pageNotFound, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  static Route<dynamic> _errorRouteWithMessage(String message) {
    return CupertinoPageRoute(
      builder: (_) =>
          Scaffold(
            body: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          ),
    );
  }
}
