import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/features/auth/presention/pages/register/register_screen.dart';
import '../../features/exams/presentation/pages/exams_screen.dart';
import '../../features/home/domain/entities/get_all_subjects_entity.dart';
import '../../features/splash/splash_screen.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_cubit.dart';
import 'package:online_exam/features/exams/presentation/pages/exam_details_screen.dart';
import '../../features/exam/presentation/pages/exam_view.dart';
import '../../core/shared_widgets/custom_bottom_nav.dart';
import '../../core/values/app_strings.dart';
import '../../features/auth/presention/manager/login/login_cubit.dart';
import 'package:online_exam/features/exam/presentation/pages/exam_score_view.dart';
import '../../features/auth/presention/pages/login/login_screen.dart';
import '../../features/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import '../../features/forget_password/presentation/pages/forget_password_enter_email_view.dart';
import '../../features/forget_password/presentation/pages/forget_password_new_password_view.dart';
import '../../features/forget_password/presentation/pages/forget_password_verify_otp_view.dart';
import '../di/di.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      /// Splash Screen
      case Routes.splashRoute:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());

      /// Login Screen
      case Routes.loginRoute:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      /// Register Screen
      case Routes.registerRoute:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<RegisterCubit>(),
            child: RegisterScreen(),
          ),
        );

      case Routes.forgetPasswordEnterEmailViewRoute:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordEnterEmailView(),
          ),
        );

      case Routes.forgetPasswordOtpViewRoute:
        final cubit = settings.arguments as ForgetPasswordCubit;

        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const ForgetPasswordVerifyOtpView(),
          ),
        );

      case Routes.forgetPasswordNewPassViewRoute:
        final cubit = settings.arguments as ForgetPasswordCubit;

        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const ForgetPasswordNewPasswordView(),
          ),
        );

      case Routes.homeRoute:
        return CupertinoPageRoute(builder: (_) => CustomBottomNavBar());

      case Routes.examsRoute:
        final String subjectId = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (_) => ExamsScreen(subjectId: subjectId),
        );

      case Routes.examDetailsRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
          builder: (_) => ExamDetailsScreen(
            examTitle: args['title'],
            examDuration: args['duration'],
            examNumberOfQuestions: args['numberOfQuestions'],
          ),
        );

      case Routes.examViewRoute:
        return CupertinoPageRoute(
          builder: (_) => ExamView(),
          settings: settings,
        );

      case Routes.examScoreViewRoute:
        return CupertinoPageRoute(
          builder: (_) => ExamScoreView(),
          settings: settings,
        );

      /// Default (Unknown Route)
      default:
        return _errorRoute();
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
}
