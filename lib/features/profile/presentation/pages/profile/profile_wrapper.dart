import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/config/user/manager/user_cubit.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/pages/profile/profile_screen.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<UpdateProfileCubit>()),
        BlocProvider(create: (_) => getIt<UserCubit>()),
      ],
      child: const ProfileScreen(),
    );
  }
}
