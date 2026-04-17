import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/user/manager/user_cubit.dart';
import 'package:online_exam/core/theme/app_theme.dart';

import 'core/helpers/custom_bloc_observer.dart';

import 'config/di/di.dart';
import 'config/route_manager/route_generator.dart';
import 'config/route_manager/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => UserCubit(getIt<GetUserDataUseCase>()),
          child: MaterialApp(
            title: 'Online Exam',
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.examViewRoute,
            onGenerateRoute: RouteGenerator.getRoute,
          ),
        );
      },
    );
  }
}

//? mousa1152003@gmail.com
//? Mohamed@123
