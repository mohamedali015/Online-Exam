import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage('assets/png/exam.png'),
          radius: MyResponsive.radius(value: 55),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: AppColors.changeProfilePhotoblue,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
        ),
      ],
    );
  }
}
