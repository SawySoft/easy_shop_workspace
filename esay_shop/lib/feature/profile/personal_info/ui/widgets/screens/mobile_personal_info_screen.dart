import 'package:easy_localization/easy_localization.dart';
import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/data/admin_response_model.dart';
import '../../../../../../core/shred/ui/ProfileAvatar.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../custom_info_card.dart';

class MobilePersonalInfoScreen extends StatelessWidget {
  const MobilePersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentClient = Bingo.call<ClientResponseModel>("client_data");
    final theme = Theme.of(context);
    final hasImage = currentClient?.pictureUrl != null && currentClient!.pictureUrl!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text('profile_details_title'.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.vGap,
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.orange, width: 2),
              ),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: AppColors.orange.withValues(alpha: 0.1),
                backgroundImage: hasImage ? NetworkImage(currentClient.pictureUrl!) : null,
                child: !hasImage
                    ? Text(
                  getInitials(currentClient?.name ?? ''),
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                )
                    : null,
              ),
            ),
            16.vGap,
            Text(
              currentClient?.name ?? 'guest_user'.tr(),
              style: theme.textTheme.displayMedium,
            ),
            4.vGap,
            Text(
              currentClient?.email ?? 'no_email_provided'.tr(),
              style: theme.textTheme.headlineMedium,
            ),
            32.vGap,
            CustomInfoCard(
              icon: Icons.person_outline,
              title: 'full_name_label'.tr(),
              value: currentClient?.name ?? 'not_available'.tr(),
            ),
            12.vGap,
            CustomInfoCard(
              icon: Icons.email_outlined,
              title: 'email_address_label'.tr(),
              value: currentClient?.email ?? 'not_available'.tr(),
            ),
            12.vGap,
            CustomInfoCard(
              icon: Icons.phone_outlined,
              title: 'phone_number_label'.tr(),
              value: currentClient?.phone ?? 'not_available'.tr(),
            ),
            12.vGap,
            CustomInfoCard(
              icon: Icons.location_on_outlined,
              title: 'address_label'.tr(),
              value: (currentClient?.address != null && currentClient!.address!.isNotEmpty)
                  ? currentClient.address!
                  : 'location_not_specified'.tr(),
            ),
            40.vGap,
          ],
        ),
      ),
    );
  }
}