import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../maps/ui/osm_map_screen.dart';
import '../../../models/order_model.dart';

class DeliveryInfoSection extends StatelessWidget {
  final String address;
  final OrderModel order;

  const DeliveryInfoSection({super.key, required this.address, required this.order});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('delivery_section_title'.tr(), style: textTheme.headlineMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 18, color: AppColors.grey),
              8.hGap,
              Expanded(child: Text(address, style: textTheme.titleMedium)),
            ],
          ),
          8.vGap,
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(
                    latitude: order.latitude ?? 30.3333,
                    longitude: order.longitude ?? 31.3333,
                    storeName: order.client?.name ?? '',
                  ),
                ),
              );
            },
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18, color: AppColors.orange),
                8.hGap,
                Text('delivery_view_on_map'.tr(), style: textTheme.titleMedium!.copyWith(color: AppColors.orange)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}