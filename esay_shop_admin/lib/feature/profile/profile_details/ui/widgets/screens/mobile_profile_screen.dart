import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../business_documents_card.dart';
import '../business_info_card.dart';
import '../profile_header.dart';
import '../profile_info_card.dart';

class MobileProfileScreen extends StatelessWidget {
  const MobileProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            16.vGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const ProfileInfoCard(),
                  12.vGap,
                  const BusinessInfoCard(),
                  12.vGap,
                  const BusinessDocumentsCard(),
                  20.vGap,
                  CustomButton(
                    text: "profile_edit_button".tr(),
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.editProfile.route),
                  ),
                  24.vGap,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}