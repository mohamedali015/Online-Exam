import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/features/home/presentation/pages/home_screen.dart';

import '../../features/auth/presentation/pages/login/login_screen.dart';


class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

     /// Login Screen
      case Routes.loginRoute:
        return CupertinoPageRoute(builder: (_) => LoginScreen(),);
        case Routes.homeRoute:
        return CupertinoPageRoute(builder: (_) => HomeScreen(),);


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
