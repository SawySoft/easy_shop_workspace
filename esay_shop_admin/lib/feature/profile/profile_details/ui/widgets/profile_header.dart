import 'package:bingo/bingo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shred/data/admin_response_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminResponseModel? currentAdmin = Bingo.call<AdminResponseModel>("admin_data");
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(currentAdmin?.pictureUrl ?? '')),
              14.hGap,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentAdmin?.name ?? "",
                      style: theme.textTheme.titleLarge?.copyWith(color: AppColors.white),
                    ),
                    Text(
                      currentAdmin?.businessName ?? "",
                      style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.white.withAlpha(150)),
                    ),
                    Text(
                      currentAdmin?.email ?? "",
                      style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.white.withAlpha(150)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.vGap,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: BorderRadius.circular(12)),
            child: Text(
              'profile_header_merchant_role'.tr(),
              style: theme.textTheme.labelLarge?.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}