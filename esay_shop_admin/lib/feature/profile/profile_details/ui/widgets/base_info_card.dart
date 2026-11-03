import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class BaseInfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

   const BaseInfoCard({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const .all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: .circular(16),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineSmall ,
          ),
          12.vGap,
          ...children,
        ],
      ),
    );
  }
}