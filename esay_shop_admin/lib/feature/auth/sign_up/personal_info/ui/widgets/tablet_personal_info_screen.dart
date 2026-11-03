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

class TabletPersonalInfoScreen extends StatelessWidget {
   const TabletPersonalInfoScreen({super.key});
   static  final GlobalKey<FormState> personalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignUpCubit cubit = context.read<SignUpCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account', style: theme.textTheme.titleLarge),
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
                  child: Form(
                    key: personalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const StepIndicators(step1Color: AppColors.accentLight),
                        12.vGap,
                        const Text('Step 1 of 3 — Personal'),
                        8.vGap,
                        Text('Personal Information', style: theme.textTheme.titleLarge),
                        24.vGap,
                        const CustomFieldLabel('Full Name'),
                        8.vGap,
                        CustomTextField(
                          'Enter your full name',
                          controller: cubit.nameController,
                          validator: cubit.validateName,
                          keyboardType: TextInputType.name,
                        ),
                        20.vGap,
                        const CustomFieldLabel('Email'),
                        8.vGap,
                        CustomTextField(
                          'Enter your email',
                          controller: cubit.emailController,
                          validator: cubit.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        20.vGap,
                        const CustomFieldLabel('Phone Number'),
                        8.vGap,
                        CustomTextField(
                          'Enter your phone number',
                          controller: cubit.phoneController,
                          validator: cubit.validatePhone,
                          keyboardType: TextInputType.phone,
                        ),
                        20.vGap,
                        const CustomFieldLabel('National ID'),
                        8.vGap,
                        CustomTextField(
                          'Enter your national ID',
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
                              text: isLoading ? 'Loading...' : 'Continue',
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
                              "Already have an account?",
                              style: TextStyle(fontSize: 16, color: AppColors.orange),
                            ),
                          ),
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