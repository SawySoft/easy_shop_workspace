import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class ProductDetailsInfoCard extends StatelessWidget {
  final String category;
  final String addedDate;

  const ProductDetailsInfoCard({
    super.key,
    required this.category,
    required this.addedDate,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'product_details_section_title'.tr(),
            style: theme.textTheme.headlineMedium,
          ),
          12.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'product_details_category_label'.tr(),
                style: theme.textTheme.headlineMedium,
              ),
              Text(
                category,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          12.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'product_details_added_label'.tr(),
                style: theme.textTheme.headlineMedium,
              ),
              Text(
                addedDate,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}