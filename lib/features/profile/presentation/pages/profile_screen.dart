import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';

import '../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../../../config/route_manager/routes.dart';

class  ProfileScreen extends StatelessWidget {
  const  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: GestureDetector(
        onTap: () async{
      await SecureCacheHelper.removeData(key: CacheKeys.token);
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    },
    child: Text("Log out",style: AppTextStyles.regular24,),
    ),
    ),
    );
  }
}
