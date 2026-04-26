import 'package:flutter/material.dart';
import 'package:online_exam/core/values/app_strings.dart';

class CancelEditsDialog extends StatelessWidget {
  const CancelEditsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.discardChanges),
      content: const Text(AppStrings.discardChangesContent),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text(AppStrings.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text(AppStrings.discard),
        ),
      ],
    );
  }
}
