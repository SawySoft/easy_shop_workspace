import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';

class ProductImagePickerWidget extends StatelessWidget {
  final String? initialImageUrl;

  const ProductImagePickerWidget({
    super.key,
    this.initialImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ImagePickerCubit, Map<String, File?>>(
      builder: (context, state) {
        final File? imageFile = state[ImageKeys.product];
        const borderRadius = BorderRadius.all(Radius.circular(12));

        return InkWell(
          onTap: () => context.read<ImagePickerCubit>().pickImage(key: ImageKeys.product),
          borderRadius: borderRadius,
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.primaryColor.withValues(alpha: 0.05),
              borderRadius: borderRadius,
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: _buildImageContent(context, imageFile, initialImageUrl),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageContent(BuildContext context, File? imageFile, String? imageUrl) {
    // 1. لو المستخدم اختر صورة جديدة من الجهاز
    if (imageFile != null) {
      return Image.file(imageFile, fit: BoxFit.cover);
    }

    // 2. لو مفيش صورة جديدة بس فيه صورة قديمة جاية من الـ API (تعديل)
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(Icons.broken_image, size: 40, color: AppColors.grey),
        ),
      );
    }

    // 3. الحالة الافتراضية (إضافة منتج جديد ومفيش صور)
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.camera_alt_outlined,
          size: 32,
          color: AppColors.grey,
        ),
        8.vGap,
        Text(
          'product_image_picker_hint'.tr(),
          style: const TextStyle(color: AppColors.grey),
        ),
      ],
    );
  }
}