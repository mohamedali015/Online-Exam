import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theme/app_theme.dart';

import 'config/cache/secure_cache/cache_keys.dart';
import 'config/cache/secure_cache/secure_cache_helper.dart';
import 'core/helpers/custom_bloc_observer.dart';

import 'config/di/di.dart';
import 'config/route_manager/route_generator.dart';
import 'config/route_manager/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = CustomBlocObserver();
  final String? token =
      await SecureCacheHelper.getData(key: CacheKeys.token);
  runApp( MyApp(token: token,));

}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final String startRoute =
    token == null ? Routes.loginRoute : Routes.homeRoute;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Online Exam',
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.loginRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }
}
