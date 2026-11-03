import 'package:bingo/bingo.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/constants/app_constants.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/utils/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      final String? adminToken = Bingo.call<String>("token");

      if (adminToken != null && adminToken.isNotEmpty) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard.route);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.personalInfo.route);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.accentLight,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: AppColors.grey, blurRadius: 10, spreadRadius: .5, offset: const Offset(0, 4)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(ImageConstants.logo, fit: BoxFit.cover),
              ),
            ),
            30.vGap,
            Text(AppConstants.appName, style: theme.textTheme.displayLarge?.copyWith(color: AppColors.white)),
            12.vGap,
            Text(
              AppConstants.appDescription,
              style: theme.textTheme.displayMedium?.copyWith(color: Colors.white.withAlpha(100)),
            ),
            60.vGap,
            Row(
              mainAxisAlignment: .center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: Colors.white.withAlpha(100), shape: BoxShape.circle),
                ),
                8.hGap,
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: Colors.white.withAlpha(100), shape: BoxShape.circle),
                ),
                8.hGap,
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: Colors.white.withAlpha(100), shape: BoxShape.circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
