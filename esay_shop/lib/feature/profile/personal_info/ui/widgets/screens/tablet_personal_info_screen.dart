import 'package:easy_localization/easy_localization.dart';
import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/data/admin_response_model.dart';
import '../../../../../../core/shred/ui/ProfileAvatar.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../custom_info_card.dart';

class TabletPersonalInfoScreen extends StatelessWidget {
  const TabletPersonalInfoScreen({super.key});

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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.vGap,
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.orange, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.orange.withValues(alpha: 0.1),
                    backgroundImage: hasImage ? NetworkImage(currentClient.pictureUrl!) : null,
                    child: !hasImage
                        ? Text(
                      getInitials(currentClient?.name ?? ''),
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : null,
                  ),
                ),
                20.vGap,
                Text(
                  currentClient?.name ?? 'guest_user'.tr(),
                  style: theme.textTheme.displayMedium?.copyWith(fontSize: 26),
                ),
                6.vGap,
                Text(
                  currentClient?.email ?? 'no_email_provided'.tr(),
                  style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
                ),
                36.vGap,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.4,
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
                20.vGap,
              ],
            ),
          ),
        ),
      ),
    );
  }
}