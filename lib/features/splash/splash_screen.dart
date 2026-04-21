import 'package:flutter/material.dart';
import 'package:online_exam/features/profile/presentation/manager/user_cubit.dart';
import 'package:online_exam/features/profile/presentation/manager/user_state.dart';
import '../../config/cache/secure_cache/cache_keys.dart';
import '../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../config/route_manager/routes.dart';
import '../profile/presentation/manager/user_events.dart';
import '../../core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _navigateToNextScreen();
  }

  void _setupAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final token = await SecureCacheHelper.getData(key: CacheKeys.token);
    final rememberMe = await SecureCacheHelper.getData(
      key: CacheKeys.rememberMe,
    );

    if (token != null && token.isNotEmpty && rememberMe == 'true') {
      final cubit = UserCubit.get(context);

      await cubit.doEvent(GetUserData());

      if (cubit.state is GetUserDataSuccessState) {
        _replaceTo(Routes.homeRoute);
      } else {
        _replaceTo(Routes.loginRoute);
      }
    } else {
      _replaceTo(Routes.loginRoute);
    }
  }

  void _replaceTo(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset(
            AppAssets.logoSplashPath,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
