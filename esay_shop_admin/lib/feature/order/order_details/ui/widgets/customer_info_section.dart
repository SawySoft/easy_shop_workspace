import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../models/client_model.dart';

class CustomerInfoSection extends StatelessWidget {
  final ClientModel? client;

  const CustomerInfoSection({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final String clientName = client?.name ?? 'customer_guest'.tr();
    final List<String> nameParts = clientName.trim().split(RegExp(r'\s+'));

    final String initialLetters = nameParts.length >= 2
        ? '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase()
        : (nameParts.isNotEmpty && nameParts[0].isNotEmpty ? nameParts[0][0].toUpperCase() : 'customer_default_initial'.tr());

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('customer_section_title'.tr(), style: textTheme.headlineMedium),
          12.vGap,
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.orange,
                child: Text(
                  initialLetters,
                  style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
              12.hGap,
              Text(clientName, style: textTheme.titleMedium),
            ],
          ),
          12.vGap,
          Row(
            children: [
              const Icon(Icons.email_outlined, size: 16, color: AppColors.grey),
              8.hGap,
              Text(client?.email ?? 'customer_no_email'.tr(), style: textTheme.headlineSmall),
            ],
          ),
          8.vGap,
          Row(
            children: [
              const Icon(Icons.phone_outlined, size: 16, color: AppColors.grey),
              8.hGap,
              Text(client?.phone ?? 'customer_no_phone'.tr(), style: textTheme.headlineSmall),
            ],
          ),
        ],
      ),
    );
  }
}