import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../business_documents_card.dart';
import '../business_info_card.dart';
import '../profile_header.dart';
import '../profile_info_card.dart';

class TabletProfileScreen extends StatelessWidget {
  const TabletProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 750),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfileHeader(),
                20.vGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const ProfileInfoCard(),
                      16.vGap,
                      const BusinessInfoCard(),
                      16.vGap,
                      const BusinessDocumentsCard(),
                      28.vGap,
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: "profile_edit_button".tr(),
                          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.editProfile.route),
                        ),
                      ),
                      32.vGap,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}