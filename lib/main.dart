import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:online_exam/config/user/manager/user_cubit.dart';
import 'package:online_exam/config/user/manager/user_state.dart';
import 'package:online_exam/core/theme/app_theme.dart';
import 'config/local_storage/local_storage.dart';
import 'core/helpers/custom_bloc_observer.dart';
import 'config/di/di.dart';
import 'config/route_manager/route_generator.dart';
import 'config/route_manager/routes.dart';
import 'core/helpers/show_session_expired_dialog.dart';
import 'core/utils/app_constants.dart';
import 'hive_registrar.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt<LocalStorage>().init();
  Hive.registerAdapters();
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
          create: (_) => getIt<UserCubit>(),
          child: MaterialApp(
            navigatorKey: AppConstants.navigatorKey,
            title: 'Online Exam',
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashRoute,
            onGenerateRoute: RouteGenerator.getRoute,

            builder: (context, child) {
              return BlocListener<UserCubit, UserState>(
                listener: (context, state) {
                  if (state.isUnauthorized) {
                    showSessionExpiredDialog();
                  }
                },
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}

//? mousa1152003@gmail.com
//? Mohamed@123
