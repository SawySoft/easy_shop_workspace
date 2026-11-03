import 'package:easy_localization/easy_localization.dart';
import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/data/admin_response_model.dart';
import '../../../../../../core/shred/ui/ProfileAvatar.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../custom_info_card.dart';

class DesktopPersonalInfoScreen extends StatelessWidget {
  const DesktopPersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentClient = Bingo.call<ClientResponseModel>("client_data");
    final theme = Theme.of(context);
    final hasImage = currentClient?.pictureUrl != null && currentClient!.pictureUrl!.isNotEmpty;

    final infoList = [
      {'icon': Icons.person_outline, 'title': 'full_name_label'.tr(), 'value': currentClient?.name ?? 'not_available'.tr()},
      {'icon': Icons.email_outlined, 'title': 'email_address_label'.tr(), 'value': currentClient?.email ?? 'not_available'.tr()},
      {'icon': Icons.phone_outlined, 'title': 'phone_number_label'.tr(), 'value': currentClient?.phone ?? 'not_available'.tr()},
      {
        'icon': Icons.location_on_outlined,
        'title': 'address_label'.tr(),
        'value': (currentClient?.address != null && currentClient!.address!.isNotEmpty)
            ? currentClient.address!
            : 'location_not_specified'.tr()
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('profile_details_title'.tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(36),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.grey.withValues(alpha: 0.2)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.orange, width: 2.5),
                      ),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: AppColors.orange.withValues(alpha: 0.1),
                        backgroundImage: hasImage ? NetworkImage(currentClient.pictureUrl!) : null,
                        child: !hasImage
                            ? Text(
                          getInitials(currentClient?.name ?? ''),
                          style: const TextStyle(
                            color: AppColors.orange,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                            : null,
                      ),
                    ),
                    24.vGap,
                    Text(
                      currentClient?.name ?? 'guest_user'.tr(),
                      style: theme.textTheme.displayMedium?.copyWith(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    8.vGap,
                    Text(
                      currentClient?.email ?? 'no_email_provided'.tr(),
                      style: theme.textTheme.headlineMedium?.copyWith(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            40.hGap,
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('personal_information_title'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 26)),
                  24.vGap,
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2.3,
                      ),
                      itemCount: infoList.length,
                      itemBuilder: (context, index) {
                        final item = infoList[index];
                        return CustomInfoCard(
                          icon: item['icon'] as IconData,
                          title: item['title'] as String,
                          value: item['value'] as String,
                        );
                      },
                    ),
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