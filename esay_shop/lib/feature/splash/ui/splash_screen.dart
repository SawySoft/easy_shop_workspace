import 'package:bingo/bingo.dart';
import 'package:esay_shop/core/shred/ui/custom_logo.dart';
import 'package:flutter/material.dart';

import '../../../app/router/app_routes.dart';
import '../../../app/theming/app_colors.dart';
import '../../../core/utils/extensions/num_extensions.dart';

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
      final String? token = Bingo.call<String>("token");

      if (token != null && token.isNotEmpty) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard.route);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.signIn.route);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            CustomLogo(),
            60.vGap,
            Row(
              mainAxisAlignment: .center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: AppColors.orange, shape: BoxShape.circle),
                ),
                8.hGap,
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: AppColors.orange, shape: BoxShape.circle),
                ),
                8.hGap,
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: AppColors.orange, shape: BoxShape.circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
