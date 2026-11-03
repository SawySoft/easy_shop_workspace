import 'package:bingo/bingo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shred/data/admin_response_model.dart';
import 'base_info_card.dart';
import 'info_row_text.dart';

class BusinessInfoCard extends StatelessWidget {
  const BusinessInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminResponseModel? currentAdmin = Bingo.call<AdminResponseModel>("admin_data");
    return BaseInfoCard(
      title: 'business_info_card_title'.tr(),
      children: [
        InfoRowText(label: 'business_info_name_label'.tr(), value: currentAdmin?.businessName ?? ''),
        InfoRowText(label: 'business_info_address_label'.tr(), value: currentAdmin?.address ?? ''),
        InfoRowText(label: 'business_info_location_label'.tr(), value: currentAdmin?.address ?? ''),
      ],
    );
  }
}