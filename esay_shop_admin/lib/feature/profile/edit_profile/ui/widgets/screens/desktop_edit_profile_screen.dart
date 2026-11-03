import 'dart:io';

import 'package:bingo/bingo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/data/admin_response_model.dart';
import '../../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../../../../../core/shred/ui/custom_action_card.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/edit_profile_cubit.dart';
import '../../../logic/edit_profile_state.dart';

class DesktopEditProfileScreen extends StatelessWidget {
  const DesktopEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePickerCubit = context.read<ImagePickerCubit>();
    final editProfileCubit = context.read<EditProfileCubit>();
    final theme = Theme.of(context);
    final currentAdmin = Bingo.call<AdminResponseModel>("admin_data");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboard.route, (route) => false),
        ),
        title: Text('edit_profile_screen_title'.tr()),
        centerTitle: true,
      ),
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('edit_profile_updating_message'.tr())),
              );
            },
            success: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message != null ? message.tr() : 'edit_profile_success_message'.tr()),
                  backgroundColor: AppColors.green,
                ),
              );
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboard.route, (route) => false);
            },
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('error_prefix'.tr(namedArgs: {'message': message.tr()})),
                  backgroundColor: AppColors.red,
                ),
              );
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              BlocBuilder<ImagePickerCubit, Map<String, File?>>(
                                builder: (context, imagesMap) {
                                  final profileFile = imagesMap[ImageKeys.profile];
                                  return CircleAvatar(
                                    radius: 55,
                                    backgroundImage: profileFile != null
                                        ? FileImage(profileFile)
                                        : (currentAdmin?.pictureUrl != null && currentAdmin!.pictureUrl!.isNotEmpty
                                        ? NetworkImage(currentAdmin.pictureUrl!)
                                        : null)
                                    as ImageProvider?,
                                    child: profileFile == null &&
                                        (currentAdmin?.pictureUrl == null || currentAdmin!.pictureUrl!.isEmpty)
                                        ? const Icon(Icons.person, size: 55)
                                        : null,
                                  );
                                },
                              ),
                              8.vGap,
                              TextButton.icon(
                                onPressed: () => imagePickerCubit.pickImage(key: ImageKeys.profile),
                                icon: const Icon(Icons.camera_alt_outlined, color: AppColors.orange, size: 18),
                                label: Text(
                                  'edit_profile_change_photo'.tr(),
                                  style: theme.textTheme.labelLarge?.copyWith(color: AppColors.orange),
                                ),
                              ),
                            ],
                          ),
                        ),
                        32.vGap,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel("edit_profile_name_label".tr()),
                                  8.vGap,
                                  CustomTextField(
                                    'edit_profile_name_hint'.tr(),
                                    controller: editProfileCubit.nameController,
                                    keyboardType: TextInputType.name,
                                  ),
                                  16.vGap,
                                  CustomFieldLabel("edit_profile_email_label".tr()),
                                  8.vGap,
                                  CustomTextField(
                                    'edit_profile_email_hint'.tr(),
                                    controller: editProfileCubit.emailController,
                                    validator: null,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  16.vGap,
                                  CustomFieldLabel("edit_profile_phone_label".tr()),
                                  8.vGap,
                                  CustomTextField(
                                    'edit_profile_phone_hint'.tr(),
                                    controller: editProfileCubit.phoneController,
                                    validator: null,
                                    keyboardType: TextInputType.phone,
                                  ),
                                ],
                              ),
                            ),
                            24.hGap,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel("edit_profile_national_id_label".tr()),
                                  8.vGap,
                                  CustomTextField(
                                    'edit_profile_national_id_hint'.tr(),
                                    controller: editProfileCubit.nationalIdController,
                                    validator: null,
                                    keyboardType: TextInputType.number,
                                  ),
                                  16.vGap,
                                  CustomFieldLabel("edit_profile_business_name_label".tr()),
                                  8.vGap,
                                  CustomTextField(
                                    'edit_profile_business_name_hint'.tr(),
                                    controller: editProfileCubit.businessNameController,
                                    validator: null,
                                    keyboardType: TextInputType.name,
                                  ),
                                  16.vGap,
                                  CustomFieldLabel("edit_profile_business_address_label".tr(), hintText: "edit_profile_optional_hint".tr()),
                                  8.vGap,
                                  CustomTextField(
                                    'edit_profile_business_address_hint'.tr(),
                                    controller: editProfileCubit.businessAddressController,
                                    validator: null,
                                    keyboardType: TextInputType.streetAddress,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        24.vGap,
                        BlocBuilder<EditProfileCubit, EditProfileState>(
                          builder: (context, state) {
                            final isLocationSet = editProfileCubit.latitude != null && editProfileCubit.longitude != null;
                            return CustomActionCard(
                              isUploaded: isLocationSet,
                              text: isLocationSet ? 'edit_profile_location_selected'.tr() : 'edit_profile_tap_location'.tr(),
                              leadingIcon: Icons.location_on_outlined,
                              onTap: () => editProfileCubit.getCurrentLocation(),
                              onDeleteTap: isLocationSet ? () => editProfileCubit.removeLocation() : null,
                            );
                          },
                        ),
                        20.vGap,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel("edit_profile_commercial_register_label".tr(), hintText: "edit_profile_optional_hint".tr()),
                                  8.vGap,
                                  BlocBuilder<ImagePickerCubit, Map<String, File?>>(
                                    builder: (context, imagesMap) {
                                      final commercialRegister = imagesMap[ImageKeys.commercialRegister];
                                      final isUploaded = commercialRegister != null;
                                      return CustomActionCard(
                                        text: isUploaded ? 'edit_profile_commercial_register_uploaded'.tr() : 'edit_profile_upload_commercial_register'.tr(),
                                        leadingIcon: Icons.file_upload_outlined,
                                        isUploaded: isUploaded,
                                        onTap: () => imagePickerCubit.pickImage(key: ImageKeys.commercialRegister),
                                        onDeleteTap: isUploaded ? () => imagePickerCubit.removeImage(ImageKeys.commercialRegister) : null,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            24.hGap,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel("edit_profile_tax_card_label".tr(), hintText: "edit_profile_optional_hint".tr()),
                                  8.vGap,
                                  BlocBuilder<ImagePickerCubit, Map<String, File?>>(
                                    builder: (context, imagesMap) {
                                      final taxCard = imagesMap[ImageKeys.taxCard];
                                      final isUploaded = taxCard != null;
                                      return CustomActionCard(
                                        text: isUploaded ? 'edit_profile_tax_card_uploaded'.tr() : 'edit_profile_upload_tax_card'.tr(),
                                        leadingIcon: Icons.file_upload_outlined,
                                        isUploaded: isUploaded,
                                        onTap: () => imagePickerCubit.pickImage(key: ImageKeys.taxCard),
                                        onDeleteTap: isUploaded ? () => imagePickerCubit.removeImage(ImageKeys.taxCard) : null,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        36.vGap,
                        BlocBuilder<EditProfileCubit, EditProfileState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);
                            return CustomButton(
                              text: isLoading ? 'edit_profile_saving_button'.tr() : 'edit_profile_save_changes_button'.tr(),
                              onPressed: isLoading
                                  ? () {}
                                  : () {
                                final imagesMap = imagePickerCubit.state;
                                editProfileCubit.profileImage = imagesMap[ImageKeys.profile];
                                editProfileCubit.commercialRegister = imagesMap[ImageKeys.commercialRegister];
                                editProfileCubit.taxCard = imagesMap[ImageKeys.taxCard];

                                editProfileCubit.updateAdminProfile();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}