import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/features/forget_password/presentation/widgets/forget_password_flow.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      /// Login Screen
      case Routes.loginRoute:
        return CupertinoPageRoute(builder: (_) => Container());

      case Routes.forgetPasswordFlow:
        return CupertinoPageRoute(
          builder: (_) => ForgetPasswordFlow(),
          settings: settings,
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
          child: Text('Page Not Found', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
