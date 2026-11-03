import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/feature/home/ui/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class DesktopStatsGrid extends StatelessWidget {
  final dynamic data;
  const DesktopStatsGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        StatCard(
          title: 'stat_total_products'.tr(),
          value: '${data.totalProducts}',
          icon: Icons.inventory_2_outlined,
          iconColor: AppColors.orange,
          bgColor: AppColors.paleOrangeBg,
        ),
        StatCard(
          title: 'stat_total_orders'.tr(),
          value: '${data.totalOrders}',
          icon: Icons.shopping_bag_outlined,
          iconColor: AppColors.blue,
          bgColor: AppColors.babyBlue,
        ),
        StatCard(
          title: 'stat_pending_orders'.tr(),
          value: '${data.pendingOrders}',
          icon: Icons.access_time_rounded,
          iconColor: AppColors.orange,
          bgColor: AppColors.paleOrangeBg,
        ),
        StatCard(
          title: 'stat_categories'.tr(),
          value: '${data.categoriesCount}',
          icon: Icons.sell_outlined,
          iconColor: AppColors.green,
          bgColor: AppColors.mintGreen,
        ),
      ],
    );
  }
}