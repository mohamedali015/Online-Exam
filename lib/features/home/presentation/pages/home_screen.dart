import 'package:flutter/material.dart';
import 'package:online_exam/features/home/domain/entities/get_all_subjects_entity.dart';
import '../../../../config/route_manager/routes.dart';
import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubjectCard(
              item: SubjectEntity(
                id: '69d980107c82914570305dbd',
                icon: '',
                name: 'name',
              ),
            ),
            SubjectCard(
              item: SubjectEntity(
                id: '69d980107c82914570305dbd',
                icon: '',
                name: 'Flutter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final SubjectEntity item;

  const SubjectCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.examsRoute, arguments: item);
      },
      child: Card(
        elevation: 3,
        color: AppColors.baseWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Row(
            children: [const Icon(Icons.percent), const SizedBox(width: 30)],
          ),
        ),
      ),
    );
  }
}
