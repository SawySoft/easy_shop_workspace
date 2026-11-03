import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/shred/logic/image_picker/image_picker_cubit.dart';
import 'package:esay_shop_admin/core/shred/ui/custom_action_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/logic/validators.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../../widgets/step_indicators.dart';
import '../../../logic/sign_up_cubit.dart';
import '../../../logic/sign_up_state.dart';

class MobileBusinessInfoScreen extends StatelessWidget {
  const MobileBusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final SignUpCubit signUpCubit = context.read<SignUpCubit>();
    final GlobalKey<FormState> businessKey = GlobalKey<FormState>();
    final ImagePickerCubit imagePickerCubit = context.read<ImagePickerCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'create_account'.tr(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepIndicators(
                step1Color: AppColors.accentLight,
                step2Color: AppColors.accentLight,
              ),
              12.vGap,
              Text(
                'step_indicator_2'.tr(),
              ),
              8.vGap,
              Text(
                'business_info_title'.tr(),
                style: theme.textTheme.titleLarge,
              ),
              24.vGap,
              CustomFieldLabel('business_name_label'.tr()),
              8.vGap,
              Form(
                key: businessKey,
                child: CustomTextField(
                  'business_name_hint'.tr(),
                  keyboardType: TextInputType.name,
                  controller: signUpCubit.businessNameController,
                  validator: Validators.validateName,
                ),
              ),
              20.vGap,
              CustomFieldLabel('business_address_label'.tr(), hintText: 'optional_hint'.tr()),
              8.vGap,
              CustomTextField('optional_hint'.tr(), controller: signUpCubit.businessAddressController),
              20.vGap,
              CustomFieldLabel('store_location_label'.tr(), hintText: 'optional_hint'.tr()),
              8.vGap,
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  final cubit = context.read<SignUpCubit>();
                  final isUploaded = cubit.latitude != null && cubit.longitude != null;

                  final buttonText = state.maybeWhen(
                    success: (responseMessage) {
                      return responseMessage ?? (isUploaded ? 'location_selected'.tr() : 'tap_to_set_location'.tr());
                    },
                    orElse: () {
                      return isUploaded ? 'location_selected'.tr() : 'tap_to_set_location'.tr();
                    },
                  );
                  return CustomActionCard(
                    isUploaded: isUploaded,
                    text: buttonText,
                    leadingIcon: Icons.location_on_outlined,
                    onTap: () => signUpCubit.getCurrentLocation(),
                    onDeleteTap: isUploaded ? () => signUpCubit.removeLocation() : null,
                  );
                },
              ),
              20.vGap,
              CustomFieldLabel('commercial_register_label'.tr(), hintText: 'optional_hint'.tr()),
              8.vGap,
              BlocBuilder<ImagePickerCubit, Map<String, File?>>(
                builder: (context, imagesMap) {
                  final commercialRegister = imagesMap[ImageKeys.commercialRegister];
                  final isUploaded = commercialRegister != null;
                  return CustomActionCard(
                    text: isUploaded ? 'commercial_register_uploaded'.tr() : 'upload_commercial_register'.tr(),
                    leadingIcon: Icons.file_upload_outlined,
                    isUploaded: isUploaded,
                    onTap: () => imagePickerCubit.pickImage(key: ImageKeys.commercialRegister),
                    onDeleteTap: isUploaded ? () => imagePickerCubit.removeImage(ImageKeys.commercialRegister) : null,
                  );
                },
              ),
              8.vGap,
              CustomFieldLabel('tax_card_label'.tr(), hintText: 'optional_hint'.tr()),
              8.vGap,
              BlocBuilder<ImagePickerCubit, Map<String, File?>>(
                builder: (context, imagesMap) {
                  final texCard = imagesMap[ImageKeys.taxCard];
                  final isUploaded = texCard != null;
                  return CustomActionCard(
                    text: isUploaded ? 'tax_card_uploaded'.tr() : 'upload_tax_card'.tr(),
                    leadingIcon: Icons.file_upload_outlined,
                    isUploaded: isUploaded,
                    onTap: () => imagePickerCubit.pickImage(key: ImageKeys.taxCard),
                    onDeleteTap: isUploaded ? () => imagePickerCubit.removeImage(ImageKeys.taxCard) : null,
                  );
                },
              ),
              32.vGap,
              CustomButton(
                text: 'continue_button'.tr(),
                onPressed: () {
                  if (businessKey.currentState?.validate() ?? false) {
                    Navigator.of(context).pushNamed(AppRoutes.security.route);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}