import 'package:flutter/material.dart';
import 'package:online_exam/core/shared_widgets/svg_wrapper.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/result/presentation/pages/result_screen.dart';
import '../helpers/my_responsive.dart';
import '../utils/app_colors.dart';
import '../utils/app_assets.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ResultScreen(),
    const ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTap,
        items: [
          _buildItem(AppAssets.homePath, 'Explore', 0),
          _buildItem(AppAssets.resultPath, 'Result', 1),
          _buildItem(AppAssets.profilePath, 'Profile', 2),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(String image, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: MyResponsive.paddingSymmetric(vertical: 8,horizontal: 20),
        decoration: BoxDecoration(
          color: currentIndex == index
              ? AppColors.selectedBlue
              : Colors.transparent,
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 12)),
        ),
        child: SvgWrapper(
          path: image,
          width: MyResponsive.width(value: 28),
          height: MyResponsive.height(value: 28),
          fit: BoxFit.contain,
          color: currentIndex == index
              ? AppColors.primaryColor
              : AppColors.disabledGray,
        ),
      ),
      label: label,
    );
  }
}
