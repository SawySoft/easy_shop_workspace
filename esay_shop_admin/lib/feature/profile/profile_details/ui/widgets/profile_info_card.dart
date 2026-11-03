import 'package:bingo/bingo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/shred/data/admin_response_model.dart';
import 'package:flutter/material.dart';
import 'base_info_card.dart';
import 'info_row.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminResponseModel? currentAdmin = Bingo.call<AdminResponseModel>("admin_data");
    return BaseInfoCard(
      title: 'profile_info_card_title'.tr(),
      children: [
        InfoRow(icon: Icons.person_outline, label: 'profile_info_name_label'.tr(), value: currentAdmin?.name ?? ''),
        InfoRow(icon: Icons.email_outlined, label: 'profile_info_email_label'.tr(), value: currentAdmin?.email ?? ''),
        InfoRow(icon: Icons.phone_outlined, label: 'profile_info_phone_label'.tr(), value: currentAdmin?.phone ?? ''),
        InfoRow(icon: Icons.tag, label: 'profile_info_national_id_label'.tr(), value: currentAdmin?.nationalId ?? ''),
      ],
    );
  }
}