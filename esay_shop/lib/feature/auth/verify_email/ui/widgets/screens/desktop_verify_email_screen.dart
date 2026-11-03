import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/ui/custom_logo.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/verify_email_cubit.dart';
import '../otp_input_fields.dart';

class DesktopVerifyEmailScreen extends StatelessWidget {
  const DesktopVerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<VerifyEmailCubit>();
    final ValueNotifier<String> otpCodeNotifier = ValueNotifier<String>('');

    return Material(
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('verify_success_msg'.tr()), backgroundColor: AppColors.green),
                );
                Navigator.of(context).pushReplacementNamed(AppRoutes.verifySuccessScreen.route);
              },
              resendSuccess: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('resend_success_msg'.tr()),
                    backgroundColor: AppColors.green,
                  ),
                );
              },
              failure: (errorMessage) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage), backgroundColor: AppColors.red),
                );
              },
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

            return Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    color: AppColors.orange.withValues(alpha: 0.08),
                    padding: const EdgeInsets.all(48.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomLogo(),
                        32.vGap,
                        Text(
                          'secure_account_title'.tr(),
                          style: theme.textTheme.titleLarge?.copyWith(fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        16.vGap,
                        Text(
                          'secure_account_desc'.tr(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(height: 1.6, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(48.0),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.paleOrangeBg,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.mail_outline_rounded, size: 40, color: AppColors.orange),
                            ),
                            24.vGap,
                            Text('verify_email_title'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
                            12.vGap,
                            Text(
                              'verify_email_desc'.tr(),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium,
                            ),
                            32.vGap,
                            OtpInputFields(
                              onCompleted: (pinCode) {
                                otpCodeNotifier.value = pinCode;
                                cubit.verifyOtp(pinCode: pinCode);
                              },
                            ),
                            24.vGap,
                            ValueListenableBuilder<int>(
                              valueListenable: cubit.timerNotifier,
                              builder: (context, remainingSeconds, child) {
                                final isResendEnabled = remainingSeconds == 0;
                                final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
                                final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
                                final formattedTime = '$minutes:$seconds';

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time_rounded, size: 16, color: Colors.grey.shade500),
                                        const SizedBox(width: 6),
                                        Text('code_expires_in'.tr(), style: theme.textTheme.headlineMedium),
                                        Text(
                                          formattedTime,
                                          style: theme.textTheme.labelLarge?.copyWith(
                                            color: isResendEnabled ? AppColors.red : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                    32.vGap,
                                    SizedBox(
                                      width: double.infinity,
                                      height: 52,
                                      child: ElevatedButton(
                                        onPressed: isLoading
                                            ? null
                                            : () {
                                          final code = otpCodeNotifier.value;
                                          if (code.length == 6) {
                                            cubit.verifyOtp(pinCode: code);
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('otp_incomplete_msg'.tr()),
                                                backgroundColor: AppColors.orange,
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.orange,
                                          disabledBackgroundColor: AppColors.orange.withValues(alpha: 0.4),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                        ),
                                        child: isLoading
                                            ? const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2.5),
                                        )
                                            : Text(
                                          'verify_button'.tr(),
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                    16.vGap,
                                    TextButton.icon(
                                      onPressed: (isResendEnabled && !isLoading)
                                          ? () {
                                        cubit.resendOtp();
                                      }
                                          : null,
                                      icon: Icon(
                                        Icons.refresh_rounded,
                                        size: 18,
                                        color: isResendEnabled ? AppColors.orange : AppColors.grey,
                                      ),
                                      label: Text(
                                        'resend_code'.tr(),
                                        style: TextStyle(
                                          color: isResendEnabled ? AppColors.orange : AppColors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            24.vGap,
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.paleOrangeBg,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(fontSize: 13, color: AppColors.grey),
                                  children: [
                                    TextSpan(text: 'demo_hint_prefix'.tr()),
                                    const TextSpan(
                                      text: '123456',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.orange),
                                    ),
                                    TextSpan(text: 'demo_hint_suffix'.tr()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}