import 'package:flutter/material.dart';
import 'package:online_exam/core/shared_widgets/cached_network_image_wrapper.dart';
import 'package:online_exam/features/home/domain/entities/get_all_subjects_entity.dart';

import '../../../../config/route_manager/routes.dart';
import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';

class SubjectCard extends StatelessWidget {
  final SubjectEntity item;

  const SubjectCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.examsRoute, arguments: item);
      },
      child: Container(
        margin: MyResponsive.paddingSymmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 5)),
          boxShadow: const [
            BoxShadow(
              color: AppColors.selectedBlue,
              spreadRadius: 0,
              offset: Offset.zero,
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: MyResponsive.paddingSymmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              item.icon != null && item.icon!.isNotEmpty
                  ? CachedNetworkImageWrapper(
                      imagePath: item.icon!,
                      width: MyResponsive.width(value: 50),
                      height: MyResponsive.height(value: 50),
                      fit: BoxFit.contain,
                    )
                  : const Icon(Icons.book),

              SizedBox(width: MyResponsive.width(value: 20)),

              Expanded(
                child: Text(
                  item.name ?? AppStrings.noNameFound,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular16(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
