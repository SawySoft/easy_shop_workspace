import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/shred/logic/visibility_cubit.dart';
import '../../../../../core/shred/ui/custom_button.dart';
import '../../../../../core/shred/ui/custom_field_label.dart';
import '../../../../../core/shred/ui/custom_logo.dart';
import '../../../../../core/shred/ui/custom_text_field.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../logic/sign_in_cubit.dart';

class TabletSignInScreen extends StatelessWidget {
  const TabletSignInScreen({super.key});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final SignInCubit cubit = context.read<SignInCubit>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (email) {
              Navigator.of(context).pushNamed(AppRoutes.verifyEmail.route, arguments: email);
            },
            failure: (message) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message), backgroundColor: AppColors.red));
            },
          );
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomLogo(),
                      36.vGap,
                      Text("welcome_back".tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
                      10.vGap,
                      Text("sign_to_continue".tr(), style: theme.textTheme.headlineMedium),
                      16.vGap,
                      CustomFieldLabel("email_label".tr()),
                      CustomTextField(
                        "email_hint".tr(),
                        controller: cubit.emailController,
                        validator: cubit.validateEmail,
                      ),
                      16.vGap,
                      CustomFieldLabel("password_label".tr()),
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
                      24.vGap,
                      BlocBuilder<SignInCubit, SignInState>(
                        builder: (context, state) {
                          bool isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

                          return CustomButton(
                            text: isLoading ? "loading".tr() : "login".tr(),
                            onPressed: isLoading
                                ? null
                                : () {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                cubit.emitLoginStates();
                              }
                            },
                          );
                        },
                      ),
                      32.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("dont_have_account".tr(), style: TextStyle(color: AppColors.disableLight)),
                          TextButton(
                            onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.signUp.route),
                            child: Text("create_account".tr(), style: TextStyle(fontSize: 16, color: AppColors.orange)),
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
      ),
    );
  }
}