import 'package:bingo/bingo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shred/data/admin_response_model.dart';
import 'base_info_card.dart';
import 'document_row.dart';

class BusinessDocumentsCard extends StatelessWidget {
  const BusinessDocumentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminResponseModel? admin = Bingo.call<AdminResponseModel>("admin_data");
    return BaseInfoCard(
      title: 'business_documents_card_title'.tr(),
      children: [
        DocumentRow(
          label: 'business_documents_commercial_register'.tr(),
          isUploaded: admin?.commercialRegisterUrl != null ? true : false,
        ),
        DocumentRow(
          label: 'business_documents_tax_card'.tr(),
          isUploaded: admin?.taxCardUrl != null ? true : false,
        ),
      ],
    );
  }
}