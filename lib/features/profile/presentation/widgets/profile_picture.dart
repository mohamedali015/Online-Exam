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
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.baseGray,
              width: MyResponsive.width(value: 2),
            ),
          ),
          child: CircleAvatar(
            backgroundImage: const AssetImage(AppAssets.profileImagePath),
            backgroundColor: AppColors.baseWhite,
            radius: MyResponsive.radius(value: 42),
          ),
        ),
        Container(
          height: MyResponsive.height(value: 24),
          width: MyResponsive.width(value: 24),
          decoration: BoxDecoration(
            color: AppColors.changeProfilePhotoblue,
            borderRadius: BorderRadius.circular(MyResponsive.radius(value: 6)),
          ),
          child: Icon(
            Icons.camera_alt_outlined,
            color: AppColors.baseWhite,
            size: MyResponsive.fontSize(value: 18),
          ),
        ),
      ],
    );
  }
}
