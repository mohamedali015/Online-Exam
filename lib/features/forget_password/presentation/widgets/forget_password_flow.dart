import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/features/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:online_exam/features/forget_password/presentation/pages/forget_password_enter_email_view.dart';

import '../../domain/use_cases/enter_email_forget_password_use_case.dart';
import '../manager/forget_password_enter_email_cubit/forget_password_enter_email_cubit.dart';

class ForgetPasswordFlow extends StatelessWidget {
  const ForgetPasswordFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ForgetPasswordCubit()),
        BlocProvider(
          create: (context) =>
              ForgetPasswordEnterEmailCubit(getIt.get<EnterEmailUseCase>()),
        ),
      ],
      child: Navigator(
        initialRoute: Routes.forgetPasswordEnterEmailView,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.forgetPasswordEnterEmailView:
              return MaterialPageRoute(
                builder: (_) => ForgetPasswordEnterEmailView(),
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
          child: Text('Page Not Found', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
