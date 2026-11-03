import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';


class InfoRowText extends StatelessWidget {
  final String label, value;

  const InfoRowText({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const .symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Text(label, style: theme.textTheme.headlineSmall),
          12.hGap,
          Expanded(
            child: Text(
              value,
              textAlign: .end,
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
