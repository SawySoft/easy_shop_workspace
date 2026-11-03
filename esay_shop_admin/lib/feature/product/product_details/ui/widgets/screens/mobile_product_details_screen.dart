import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../../models/product_model.dart';
import '../product_description_card.dart';
import '../product_details_info_card.dart';
import '../product_header_image.dart';
import '../product_info_header.dart';
import '../product_stats_cards.dart';

class MobileProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const MobileProductDetailsScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final bool isVisible = product.visible == 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('product_details_appbar_title'.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.upsertProduct.route, arguments: product),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductHeaderImage(imageUrl: product.image ?? ''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.vGap,
                  ProductInfoHeader(
                    title: product.name ?? 'product_item_default_name'.tr(),
                    category: product.categoryName ?? 'product_item_uncategorized'.tr(),
                  ),
                  16.vGap,
                  ProductStatsCards(
                    price: product.price?.toString() ?? '0',
                    inStock: product.quantity?.toString() ?? '0',
                    isVisible: isVisible,
                  ),
                  16.vGap,
                  ProductDescriptionCard(description: product.description ?? 'product_details_no_description'.tr()),
                  16.vGap,
                  ProductDetailsInfoCard(
                    category: product.categoryName ?? 'product_item_uncategorized'.tr(),
                    addedDate: product.getFormattedDate(),
                  ),
                  24.vGap,
                  CustomButton(
                    text: 'product_details_edit_button'.tr(),
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.upsertProduct.route, arguments: product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}