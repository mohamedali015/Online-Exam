import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import '../../core/shared_widgets/custom_bottom_nav_bar.dart';
import 'package:online_exam/features/auth/presention/pages/register/register_screen.dart';
import '../../features/exams/presentation/pages/exams_screen.dart';
import '../../features/home/domain/entities/get_all_subjects_entity.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/auth/presention/pages/login/login_screen.dart';

import 'package:online_exam/features/forget_password/presentation/widgets/forget_password_flow.dart';

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      /// Splash Screen
      case Routes.splashRoute:
        return CupertinoPageRoute(builder: (_) => const SplashScreen(),);

     /// Login Screen
      case Routes.loginRoute:
        return CupertinoPageRoute(builder: (_) => LoginScreen(),);
        case Routes.homeRoute:
        return CupertinoPageRoute(builder: (_) => CustomBottomNavBar(),);

      /// Register Screen
      case Routes.registerRoute:
        return CupertinoPageRoute(builder: (_) => RegisterScreen());

      case Routes.forgetPasswordFlowRoute:
        return CupertinoPageRoute(
          builder: (_) => ForgetPasswordFlow(),
          settings: settings,
        );
      case Routes.examsRoute:
        SubjectEntity item = settings.arguments as SubjectEntity;

        return CupertinoPageRoute(
          builder: (_) => ExamsScreen(item: item),
        );

    /// Default (Unknown Route)
      default:
        return _errorRoute();
    }

  }


  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(
            'Page Not Found',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
