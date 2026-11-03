import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theming/app_colors.dart';
import '../../../../core/utils/extensions/num_extensions.dart';

class VerifySuccessScreen extends StatelessWidget {
  const VerifySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard.route);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mintGreen,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline_sharp,
                    color: AppColors.green,
                    size: 45,
                  ),
                ),
                24.vGap,
                Text(
                  'verified_excl_title'.tr(),
                  style: theme.textTheme.titleLarge,
                ),
                8.vGap,
                Text(
                  'welcome_easy_shop_emoji'.tr(),
                  style: theme.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}