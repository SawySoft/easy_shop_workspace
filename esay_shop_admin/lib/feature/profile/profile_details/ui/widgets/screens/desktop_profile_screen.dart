import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../business_documents_card.dart';
import '../business_info_card.dart';
import '../profile_header.dart';
import '../profile_info_card.dart';

class DesktopProfileScreen extends StatelessWidget {
  const DesktopProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfileHeader(),
                24.vGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: ProfileInfoCard(),
                          ),
                          24.hGap,
                          Expanded(
                            child: Column(
                              children: [
                                const BusinessInfoCard(),
                                16.vGap,
                                const BusinessDocumentsCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      36.vGap,
                      SizedBox(
                        width: 300,
                        child: CustomButton(
                          text: "profile_edit_button".tr(),
                          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.editProfile.route),
                        ),
                      ),
                      40.vGap,
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