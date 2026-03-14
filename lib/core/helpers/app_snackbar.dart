import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

abstract class AppSnackbar {
  static void error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
    );
  }

  static void success(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
