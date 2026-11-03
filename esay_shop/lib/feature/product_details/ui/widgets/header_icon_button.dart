import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const HeaderIconButton({super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration:  BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.grey, size: 20),
        onPressed: onPressed,
      ),
    );
  }
}