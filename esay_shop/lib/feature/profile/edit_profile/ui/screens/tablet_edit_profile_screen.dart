import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/shred/data/admin_response_model.dart';
import '../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../../../../core/shred/ui/ProfileAvatar.dart';
import '../../../../../core/shred/ui/custom_action_card.dart';
import '../../../../../core/shred/ui/custom_button.dart';
import '../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../logic/edit_profile_cubit.dart';
import '../../logic/edit_profile_state.dart';

class TabletEditProfileScreen extends StatelessWidget {
  const TabletEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePickerCubit = context.read<ImagePickerCubit>();
    final cubit = context.read<EditProfileCubit>();
    final theme = Theme.of(context);
    final currentClient = Bingo.call<ClientResponseModel>("client_data");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () =>
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.dashboard.route, (Route<dynamic> route) => false),
        ),
        title: Text('edit_profile_title'.tr()),
        centerTitle: true,
      ),
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('updating_profile_msg'.tr())),
              );
            },
            success: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message != null && message.isNotEmpty ? message.tr() : 'profile_updated_success'.tr()),
                  backgroundColor: AppColors.green,
                ),
              );
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboard.route, (route) => false);
            },
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('error_prefix'.tr(namedArgs: {'message': message})),
                  backgroundColor: AppColors.red,
                ),
              );
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        clipBehavior: Clip.none,
                        children: [
                          BlocBuilder<ImagePickerCubit, File?>(
                            builder: (context, profileFile) {
                              final hasImageFromFile = profileFile != null;
                              final hasImageFromNetwork =
                                  currentClient?.pictureUrl != null && currentClient!.pictureUrl!.isNotEmpty;
                              return CircleAvatar(
                                radius: 50,
                                backgroundColor: AppColors.orange,
                                backgroundImage: hasImageFromFile
                                    ? FileImage(profileFile) as ImageProvider
                                    : (hasImageFromNetwork
                                    ? NetworkImage(currentClient.pictureUrl!) as ImageProvider
                                    : null),
                                child: (!hasImageFromFile && !hasImageFromNetwork)
                                    ? Text(
                                  getInitials(currentClient?.name ?? ''),
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                    : null,
                              );
                            },
                          ),
                          Positioned(
                            bottom: -4,
                            right: -4,
                            child: InkWell(
                              onTap: () => imagePickerCubit.pickImage(),
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: theme.scaffoldBackgroundColor, width: 2.5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.1),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.camera_alt_outlined, color: AppColors.white, size: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    28.vGap,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFieldLabel('full_name_label'.tr()),
                              8.vGap,
                              CustomTextField(
                                'enter_full_name_hint'.tr(),
                                controller: cubit.nameController,
                                keyboardType: TextInputType.name,
                              ),
                            ],
                          ),
                        ),
                        16.hGap,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFieldLabel('email_label'.tr()),
                              8.vGap,
                              CustomTextField(
                                'enter_email_hint'.tr(),
                                controller: cubit.emailController,
                                validator: null,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    16.vGap,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFieldLabel('phone_label'.tr()),
                              8.vGap,
                              CustomTextField(
                                'enter_phone_hint'.tr(),
                                controller: cubit.phoneController,
                                validator: null,
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                          ),
                        ),
                        16.hGap,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFieldLabel('address_label'.tr(), hintText: 'optional_hint'.tr()),
                              8.vGap,
                              CustomTextField(
                                'enter_address_hint'.tr(),
                                controller: cubit.addressController,
                                validator: null,
                                keyboardType: TextInputType.streetAddress,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    16.vGap,
                    BlocBuilder<EditProfileCubit, EditProfileState>(
                      builder: (context, state) {
                        final isLocationSelected = cubit.latitude != null && cubit.longitude != null;
                        return CustomActionCard(
                          text: isLocationSelected ? (cubit.address ?? 'location_selected'.tr()) : 'pick_on_map_hint'.tr(),
                          leadingIcon: Icons.location_on_outlined,
                          isUploaded: isLocationSelected,
                          onTap: () => cubit.getCurrentLocation(),
                          onDeleteTap: isLocationSelected ? () => cubit.removeLocation() : null,
                        );
                      },
                    ),
                    28.vGap,
                    BlocBuilder<EditProfileCubit, EditProfileState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);
                        return CustomButton(
                          text: isLoading ? 'saving_button'.tr() : 'save_changes_button'.tr(),
                          onPressed: isLoading
                              ? () {}
                              : () {
                            final profileFile = imagePickerCubit.state;
                            cubit.profileImage = profileFile;

                            cubit.updateClientProfile();
                          },
                        );
                      },
                    ),
                    24.vGap,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}