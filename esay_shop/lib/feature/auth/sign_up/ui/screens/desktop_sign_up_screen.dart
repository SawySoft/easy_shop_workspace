import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../../../../core/shred/logic/visibility_cubit.dart';
import '../../../../../core/shred/ui/custom_action_card.dart';
import '../../../../../core/shred/ui/custom_button.dart';
import '../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../core/shred/ui/custom_logo.dart';
import '../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

class DesktopSignUpScreen extends StatelessWidget {
  const DesktopSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpCubit cubit = context.read<SignUpCubit>();
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: AppColors.orange.withValues(alpha: 0.08),
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomLogo(),
                  28.vGap,
                  Text(
                    'join_easy_shop_today'.tr(),
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  12.vGap,
                  Text(
                    'create_account_desc'.tr(),
                    style: theme.textTheme.headlineMedium?.copyWith(height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 620),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('create_account'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
                        8.vGap,
                        Text('fill_details_below'.tr(), style: theme.textTheme.headlineMedium),
                        24.vGap,
                        Center(
                          child: BlocBuilder<ImagePickerCubit, File?>(
                            builder: (context, profileFile) {
                              return InkWell(
                                onTap: () async {
                                  await context.read<ImagePickerCubit>().pickImage();
                                  final selectedFile = context.read<ImagePickerCubit>().state;
                                  if (selectedFile != null) {
                                    cubit.setProfileImage(selectedFile);
                                  }
                                },
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.paleOrangeBg,
                                    border: Border.all(color: AppColors.orange, width: 2),
                                    image: profileFile != null
                                        ? DecorationImage(image: FileImage(profileFile), fit: BoxFit.cover)
                                        : null,
                                  ),
                                  child: profileFile == null
                                      ? const Icon(Icons.camera_alt_outlined, color: AppColors.orange, size: 32)
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        24.vGap,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel('full_name_label'.tr()),
                                  8.vGap,
                                  CustomTextField('name_hint'.tr(), validator: cubit.validateName, controller: cubit.nameController),
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
                                    'email_hint'.tr(),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: cubit.validateEmail,
                                    controller: cubit.emailController,
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
                                    'phone_hint'.tr(),
                                    keyboardType: TextInputType.phone,
                                    validator: cubit.validatePhone,
                                    controller: cubit.phoneController,
                                  ),
                                ],
                              ),
                            ),
                            16.hGap,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel('address_label'.tr()),
                                  8.vGap,
                                  CustomTextField('address_hint'.tr(), controller: cubit.addressController),
                                ],
                              ),
                            ),
                          ],
                        ),
                        12.vGap,
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            final isLocationSelected = cubit.latitude != null && cubit.longitude != null;
                            return CustomActionCard(
                              text: isLocationSelected ? (cubit.address ?? 'location_selected'.tr()) : 'pick_on_map'.tr(),
                              leadingIcon: Icons.location_on_outlined,
                              isUploaded: isLocationSelected,
                              onTap: () => cubit.getCurrentLocation(),
                              onDeleteTap: isLocationSelected ? () => cubit.removeLocation() : null,
                            );
                          },
                        ),
                        16.vGap,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel('password_label'.tr()),
                                  8.vGap,
                                  BlocBuilder<VisibilityCubit, bool>(
                                    builder: (context, isVisible) {
                                      return CustomTextField(
                                        'password_hint'.tr(),
                                        suffixIcon: isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                        controller: cubit.passwordController,
                                        validator: cubit.validatePassword,
                                        obscureText: !isVisible,
                                        onTap: () => context.read<VisibilityCubit>().toggleVisibility(),
                                        keyboardType: TextInputType.visiblePassword,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            16.hGap,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFieldLabel('confirm_password_label'.tr()),
                                  8.vGap,
                                  BlocBuilder<VisibilityCubit, bool>(
                                    builder: (context, isVisible) {
                                      return CustomTextField(
                                        'password_hint'.tr(),
                                        suffixIcon: isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                        controller: cubit.confirmPasswordController,
                                        validator: cubit.validateConfirmPassword,
                                        obscureText: !isVisible,
                                        onTap: () => context.read<VisibilityCubit>().toggleVisibility(),
                                        keyboardType: TextInputType.visiblePassword,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        28.vGap,
                        BlocConsumer<SignUpCubit, SignUpState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              success: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message ?? 'signup_success_default'.tr()),
                                    backgroundColor: AppColors.green,
                                  ),
                                );
                                Navigator.of(context).pushReplacementNamed(AppRoutes.signIn.route);
                              },
                              failure: (errorMessage) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: AppColors.red));
                              },
                            );
                          },
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);
                            return CustomButton(
                              text: 'create_account'.tr(),
                              isLoading: isLoading,
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.register();
                                }
                              },
                            );
                          },
                        ),
                        20.vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('already_have_account'.tr(), style: const TextStyle(color: AppColors.grey, fontSize: 14)),
                            InkWell(
                              onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.signIn.route),
                              child: Text(
                                'login'.tr(),
                                style: const TextStyle(color: AppColors.orange, fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}