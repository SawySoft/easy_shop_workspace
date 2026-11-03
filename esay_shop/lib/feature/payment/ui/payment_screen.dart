import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:esay_shop/feature/payment/ui/payment_web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theming/app_colors.dart';
import '../logic/payment_cubit.dart';

class PaymentScreen extends StatelessWidget {
  final String orderCode;

  const PaymentScreen({super.key, required this.orderCode});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('payment_screen_title'.tr()), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              state.maybeWhen(
                failure: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('error_prefix'.tr(namedArgs: {'message': message})),
                      backgroundColor: AppColors.red,
                    ),
                  );
                },
                success: (url) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentWebViewScreen(paymentUrl: url)),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                orElse: () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.payment_rounded, size: 80, color: AppColors.blue),
                    20.vGap,
                    Text(
                      'payment_instruction'.tr(),
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium,
                    ),
                    30.vGap,
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          context.read<PaymentCubit>().makePayment(orderCode);
                        },
                        child: Text(
                          'pay_now'.tr(),
                          style: const TextStyle(fontSize: 18, color: AppColors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}