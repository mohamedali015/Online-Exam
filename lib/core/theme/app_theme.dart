import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.baseWhite,

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyles.regular12.copyWith(color: AppColors.baseGray),
      floatingLabelStyle: TextStyles.regular12.copyWith(
        color: AppColors.baseGray,
      ),
      errorStyle: TextStyles.regular12,
      hintStyle: TextStyles.regular14.copyWith(color: AppColors.hintTextGray),
      contentPadding: EdgeInsets.symmetric(
        horizontal: MyResponsive.width(value: 8),
        vertical: MyResponsive.height(value: 12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 4)),
        borderSide: BorderSide(color: AppColors.baseGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 4)),
        borderSide: BorderSide(color: AppColors.baseGray),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 4)),
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 4)),
        borderSide: BorderSide(color: AppColors.error),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(double.infinity, MyResponsive.height(value: 48)),
        textStyle: TextStyles.medium16,
        foregroundColor: AppColors.baseWhite,
        backgroundColor: AppColors.primaryColor,
        disabledBackgroundColor: AppColors.disabledGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 100)),
        ),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.baseWhite,
      elevation: 0,
      titleTextStyle: TextStyles.medium20.copyWith(color: AppColors.baseBlack),
      iconTheme: IconThemeData(color: AppColors.baseBlack),
    ),
  );
}
