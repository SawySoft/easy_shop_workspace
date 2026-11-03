import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/shred/ui/custom_button.dart';
import '../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../core/utils/constants/image_constants.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../../sign_up/security/logic/visibility_cubit.dart';
import '../../logic/sign_in_cubit.dart';

class DesktopSignInScreen extends StatelessWidget {
  const DesktopSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final SignInCubit cubit = context.read<SignInCubit>();

    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (email) {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.verifyEmail.route,
                arguments: email,
              );
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
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: AppColors.orange.withValues(alpha: 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 140,
                      child: Image.asset(ImageConstants.logo),
                    ),
                    32.vGap,
                    Text(
                      "welcome_easy_shop".tr(),
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    12.vGap,
                    Text(
                      "admin_welcome_subtitle".tr(),
                      style: TextStyle(fontSize: 16, color: AppColors.disableLight),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    padding: const EdgeInsets.all(48.0),
                    child: Form(
                      key: SignInCubit.signInFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("welcome_back".tr(), style: theme.textTheme.titleLarge),
                          8.vGap,
                          Text("admin_sign_to_manage".tr(), style: theme.textTheme.headlineMedium),
                          8.vGap,
                          Text(
                            "for_business_label".tr(),
                            style: TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold),
                          ),
                          32.vGap,
                          CustomFieldLabel("email_label".tr()),
                          CustomTextField(
                            "admin_email_hint".tr(),
                            controller: cubit.emailController,
                            validator: cubit.validateEmail,
                          ),
                          20.vGap,
                          CustomFieldLabel("password_label".tr()),
                          BlocBuilder<VisibilityCubit, bool>(
                            builder: (context, isVisible) {
                              return CustomTextField(
                                "admin_password_hint".tr(),
                                suffixIcon: isVisible ? Icons.visibility : Icons.visibility_off,
                                controller: cubit.passwordController,
                                validator: cubit.validatePassword,
                                obscureText: !isVisible,
                                onTap: () => context.read<VisibilityCubit>().toggleVisibility(),
                                keyboardType: TextInputType.visiblePassword,
                              );
                            },
                          ),
                          28.vGap,
                          BlocBuilder<SignInCubit, SignInState>(
                            builder: (context, state) {
                              bool isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

                              return CustomButton(
                                text: isLoading ? "loading".tr() : "sign_in_button".tr(),
                                onPressed: isLoading
                                    ? null
                                    : () {
                                  FocusScope.of(context).unfocus();
                                  cubit.emitLoginStates();
                                },
                              );
                            },
                          ),
                          32.vGap,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("new_merchant_question".tr(), style: TextStyle(color: AppColors.disableLight)),
                              TextButton(
                                onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.personalInfo.route),
                                child: Text(
                                  "create_merchant_account".tr(),
                                  style: TextStyle(fontSize: 16, color: AppColors.orange),
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
      ),
    );
  }
}