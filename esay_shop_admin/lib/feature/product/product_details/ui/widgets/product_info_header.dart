import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class ProductInfoHeader extends StatelessWidget {
  final String title;
  final String category;

  const ProductInfoHeader({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge,
        ),
        4.vGap,
        Text(
          category,
          style: theme.textTheme.headlineMedium,
        ),
      ],
    );
  }
}