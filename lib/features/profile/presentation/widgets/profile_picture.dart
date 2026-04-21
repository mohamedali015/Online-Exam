import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage(AppAssets.profileImagePath),
          backgroundColor: AppColors.baseWhite,
          radius: MyResponsive.radius(value: 55),
        ),
        Container(
          height: MyResponsive.height(value: 30),
          width: MyResponsive.width(value: 30),
          decoration: BoxDecoration(
            color: AppColors.changeProfilePhotoblue,
            borderRadius: BorderRadius.circular(MyResponsive.radius(value: 6)),
          ),
          child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
        ),
      ],
    );
  }
}
