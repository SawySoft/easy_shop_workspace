import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/ui/custom_button.dart';
import '../../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../../widgets/step_indicators.dart';
import '../../../logic/sign_up_cubit.dart';
import '../../../logic/sign_up_state.dart';

class MobilePersonalInfoScreen extends StatelessWidget {
  const MobilePersonalInfoScreen({super.key});

  static final GlobalKey<FormState> personalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignUpCubit cubit = context.read<SignUpCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('create_account'.tr(), style: theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.signIn.route),
                    child: Text(
                      "already_have_account".tr(),
                      style: const TextStyle(fontSize: 16, color: AppColors.orange),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}