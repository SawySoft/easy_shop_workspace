import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../../core/utils/constants/image_constants.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../../widgets/step_indicators.dart';
import '../../../logic/sign_up_cubit.dart';
import '../../../logic/sign_up_state.dart';

class DesktopPersonalInfoScreen extends StatelessWidget {
  const DesktopPersonalInfoScreen({super.key});
  static final GlobalKey<FormState> personalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignUpCubit cubit = context.read<SignUpCubit>();

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: AppColors.orange.withValues(alpha: 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(ImageConstants.logo),
                  ),
                  24.vGap,
                  Text(
                    "create_account".tr(),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  12.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      "start_journey_desc".tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: AppColors.disableLight),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 580),
                    child: Form(
                      key: personalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StepIndicators(step1Color: AppColors.accentLight),
                          12.vGap,
                          Text('step_indicator_1'.tr()),
                          8.vGap,
                          Text('personal_information_title'.tr(), style: theme.textTheme.titleLarge),
                          24.vGap,
                          CustomFieldLabel('full_name_label'.tr()),
                          8.vGap,
                          CustomTextField(
                            'enter_full_name_hint'.tr(),
                            controller: cubit.nameController,
                            validator: cubit.validateName,
                            keyboardType: TextInputType.name,
                          ),
                          20.vGap,
                          CustomFieldLabel('email_label'.tr()),
                          8.vGap,
                          CustomTextField(
                            'enter_email_hint'.tr(),
                            controller: cubit.emailController,
                            validator: cubit.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          20.vGap,
                          CustomFieldLabel('phone_label'.tr()),
                          8.vGap,
                          CustomTextField(
                            'enter_phone_hint'.tr(),
                            controller: cubit.phoneController,
                            validator: cubit.validatePhone,
                            keyboardType: TextInputType.phone,
                          ),
                          20.vGap,
                          CustomFieldLabel('national_id_label'.tr()),
                          8.vGap,
                          CustomTextField(
                            'enter_national_id_hint'.tr(),
                            controller: cubit.nationalIdController,
                            validator: cubit.validateNationalId,
                            keyboardType: TextInputType.number,
                          ),
                          32.vGap,
                          BlocBuilder<SignUpCubit, SignUpState>(
                            builder: (context, state) {
                              final isLoading = state.maybeWhen(
                                loading: () => true,
                                orElse: () => false,
                              );
                              return CustomButton(
                                text: isLoading ? 'loading'.tr() : 'continue_button'.tr(),
                                onPressed: isLoading
                                    ? null
                                    : () {
                                  if (personalKey.currentState?.validate() ?? false) {
                                    Navigator.of(context).pushNamed(AppRoutes.businessInfo.route);
                                  }
                                },
                              );
                            },
                          ),
                          12.vGap,
                          TextButton(
                            onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.signIn.route),
                            child: Text(
                              "already_have_account".tr(),
                              style: const TextStyle(fontSize: 16, color: AppColors.orange),
                            ),
                          )
                        ],
                      ),
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