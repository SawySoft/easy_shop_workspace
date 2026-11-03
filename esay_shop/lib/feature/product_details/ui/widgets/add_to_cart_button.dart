import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final bool isAdded;
  final VoidCallback onPressed;

  const AddToCartButton({required this.onPressed, super.key, required this.isAdded});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isAdded ? AppColors.mintGreen : AppColors.orange,
          elevation: isAdded ? 0 : 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isAdded ? Icons.check_circle_outline : Icons.shopping_cart_outlined,
              color: isAdded ? AppColors.green : AppColors.white,
              size: 20,
            ),
            8.hGap,
            Text(
              isAdded ? 'added_to_cart_state'.tr() : 'add_to_cart'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isAdded ? AppColors.green : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}