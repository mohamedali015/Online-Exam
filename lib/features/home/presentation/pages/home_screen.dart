import 'package:flutter/material.dart';
import '../../../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../../../core/utils/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await SecureCacheHelper.getData(key: CacheKeys.token);
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _token ?? 'No Token Found',
          style: AppTextStyles.medium20,
        ),
      ),
    );
  }
}