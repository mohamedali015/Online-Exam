import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';

abstract class AppTextStyles {
  // =========================
  // Regular (FontWeight.w400)
  // =========================

  static TextStyle regular12() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 12),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular13() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 13),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular14() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 14),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular16() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular20() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 20),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular24() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 24),
      fontWeight: FontWeight.w400,
    );
  }

  // =========================
  // Medium (FontWeight.w500)
  // =========================

  static TextStyle medium12() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 12),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium14() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 14),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium16() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium18() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 18),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium20() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 20),
      fontWeight: FontWeight.w500,
    );
  }

  // =========================
  // SemiBold (FontWeight.w600)
  // =========================

  static TextStyle semiBold12() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 12),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold20() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 20),
      fontWeight: FontWeight.w600,
    );
  }

  // =========================
  // Bold (FontWeight.w700)
  // =========================

  static TextStyle bold16() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold20() {
    return TextStyle(
      fontSize: MyResponsive.fontSize(value: 20),
      fontWeight: FontWeight.w700,
    );
  }
}
