import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import '../../../../config/route_manager/routes.dart';
import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String id = "67003a9a728c92b7fdf4350a";
    String id1 = "67ca2e5d5554b32891261bf4";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubjectCard(
              id: id,
              name: "Math",
            ),
            SubjectCard(
              id: id1,
              name: "Flutter",
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String id;
  final String name;

  const SubjectCard({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.examsRoute, arguments: id);
      },
      child: Card(
        elevation: 3,
        color: AppColors.baseWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.percent),
              const SizedBox(width: 30),
              Text(
                name,
                textAlign: TextAlign.center,
                style: AppTextStyles.medium20.copyWith(
                  color: AppColors.baseBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}