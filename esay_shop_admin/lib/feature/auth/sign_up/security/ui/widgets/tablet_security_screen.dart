import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../../../../../core/shred/logic/validators.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../../widgets/step_indicators.dart';
import '../../../logic/sign_up_cubit.dart';
import '../../../logic/sign_up_state.dart';
import '../../logic/visibility_cubit.dart';

class TabletSecurityScreen extends StatelessWidget {
  const TabletSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignUpCubit cubit = context.read<SignUpCubit>();
    final GlobalKey<FormState> securityFormKey = GlobalKey<FormState>();
    final ImagePickerCubit imagePickerCubit = context.read<ImagePickerCubit>();

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (responseMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(responseMessage?.tr() ?? 'signup_success_default'.tr()),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.of(context).pushNamed(AppRoutes.signIn.route);
          },
          failure: (errorMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('error_prefix'.tr(namedArgs: {'message': errorMessage.tr()})),
                backgroundColor: AppColors.red,
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('create_account'.tr()),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const StepIndicators(
                          step1Color: AppColors.accentLight,
                          step2Color: AppColors.accentLight,
                          step3Color: AppColors.accentLight,
                        ),
                        12.vGap,
                        Text(
                          'step_indicator_3'.tr(),
                          style: theme.textTheme.labelMedium,
                        ),
                        8.vGap,
                        Text(
                          'security_section_title'.tr(),
                          style: theme.textTheme.titleLarge,
                        ),
                        24.vGap,
                        CustomFieldLabel('profile_picture_label'.tr(), hintText: 'optional_hint'.tr()),
                        8.vGap,
                        Row(
                          children: [
                            BlocBuilder<ImagePickerCubit, Map<String, File?>>(
                              builder: (context, imagesMap) {
                                final profileFile = imagesMap[ImageKeys.profile];
                                return CircleAvatar(
                                  backgroundColor: AppColors.black,
                                  radius: 42,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.grey,
                                    radius: 40,
                                    backgroundImage: profileFile != null ? FileImage(profileFile) : null,
                                    child: profileFile == null
                                        ? const Icon(Icons.camera_alt_outlined, size: 32, color: AppColors.black)
                                        : null,
                                  ),
                                );
                              },
                            ),
                            16.hGap,
                            InkWell(
                              onTap: () => imagePickerCubit.pickImage(key: ImageKeys.profile),
                              child: Row(
                                children: [
                                  const Icon(Icons.camera_alt_outlined, color: AppColors.orange),
                                  8.hGap,
                                  Text("upload_photo".tr(), style: const TextStyle(color: AppColors.orange)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        20.vGap,
                        CustomFieldLabel('password_label'.tr()),
                        8.vGap,
                        Form(
                          key: securityFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<VisibilityCubit, bool>(
                                builder: (context, isVisible) {
                                  return CustomTextField(
                                    validator: Validators.validatePassword,
                                    'create_strong_password_hint'.tr(),
                                    controller: cubit.passwordController,
                                    obscureText: !isVisible,
                                    keyboardType: TextInputType.visiblePassword,
                                    suffixIcon: isVisible ? Icons.visibility : Icons.visibility_off,
                                    onTap: () => context.read<VisibilityCubit>().toggleVisibility(),
                                  );
                                },
                              ),
                              32.vGap,
                              CustomFieldLabel('confirm_password_label'.tr()),
                              8.vGap,
                              BlocBuilder<VisibilityCubit, bool>(
                                builder: (context, isVisible) {
                                  return CustomTextField(
                                    obscureText: !isVisible,
                                    'repeat_password_hint'.tr(),
                                    controller: cubit.confirmPasswordController,
                                    validator: (value) => Validators.validateConfirmPassword(
                                      value,
                                      cubit.passwordController.text,
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    suffixIcon: isVisible ? Icons.visibility : Icons.visibility_off,
                                    onTap: () => context.read<VisibilityCubit>().toggleVisibility(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        32.vGap,
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            final bool isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return CustomButton(
                              text: isLoading ? 'loading'.tr() : 'create_account_button'.tr(),
                              onPressed: isLoading
                                  ? null
                                  : () {
                                if (securityFormKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();

                                  final imagesMap = imagePickerCubit.state;
                                  if (imagesMap[ImageKeys.commercialRegister] != null) {
                                    cubit.setCommercialRegister(imagesMap[ImageKeys.commercialRegister]!);
                                  }
                                  if (imagesMap[ImageKeys.taxCard] != null) {
                                    cubit.setTaxCard(imagesMap[ImageKeys.taxCard]!);
                                  }
                                  if (imagesMap[ImageKeys.profile] != null) {
                                    cubit.setProfileImage(imagesMap[ImageKeys.profile]!);
                                  }
                                  cubit.register();
                                }
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