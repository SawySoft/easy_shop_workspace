import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:flutter/material.dart';

class CustomActionCard extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final bool isUploaded;
  final VoidCallback onTap;
  final VoidCallback? onDeleteTap;

  const CustomActionCard({
    super.key,
    required this.text,
    required this.leadingIcon,
    this.isUploaded = false,
    required this.onTap,
    this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(20),
        child: Container(
          height: 52,
          padding: const .symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isUploaded ? AppColors.paleOrangeBg : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isUploaded ? AppColors.orange : AppColors.greyBorder,
              width: isUploaded ? 1.5 : 1.5,
              style: isUploaded ? .solid : .solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isUploaded ? Icons.check : leadingIcon,
                    color: isUploaded ? AppColors.orange : AppColors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    text,
                    style: TextStyle(
                      color: isUploaded ? AppColors.orange : AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (isUploaded)
                GestureDetector(
                  onTap: onDeleteTap,
                  child: const Icon(Icons.close, color: AppColors.grey, size: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
