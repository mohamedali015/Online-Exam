import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/features/profile/presentation/manager/user_cubit.dart';
import 'package:online_exam/features/profile/presentation/manager/user_events.dart';
import 'package:online_exam/features/profile/presentation/manager/user_state.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_form.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_picture.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      UserCubit.get(context).doEvent(GetUserData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetUserDataSuccessState) {
            final user = state.user;

            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: MyResponsive.paddingSymmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Column(
                    children: [
                      ProfilePicture(),
                      SizedBox(height: 40),
                      ProfileForm(user: user),
                      const SizedBox(height: 40),

                      /// UPDATE BUTTON
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Update"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          if (state is GetUserDataErrorState) {
            return Center(child: Text(state.errorMessage));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
