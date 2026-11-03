import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/order_details_cubit.dart';
import '../customer_info_section.dart';
import '../delivery_info_section.dart';
import '../order_details_header_card.dart';
import '../order_items_section.dart';
import '../order_summary_section.dart';
import '../payment_info_section.dart';

class DesktopOrderDetailsScreen extends StatelessWidget {
  const DesktopOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order_details_title'.tr()),
        centerTitle: true,
      ),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            failure: (message) => Center(
              child: Text(
                'error_prefix'.tr(namedArgs: {'message': message.tr()}),
                style: const TextStyle(color: AppColors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            success: (order) {
              return Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderDetailsHeaderCard(order: order),
                        24.vGap,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OrderItemsSection(orderItems: order.orderItems),
                                  24.vGap,
                                  OrderSummarySection(totalPrice: order.totalPrice ?? 0),
                                ],
                              ),
                            ),
                            24.hGap,
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomerInfoSection(client: order.client),
                                  20.vGap,
                                  DeliveryInfoSection(order: order, address: order.address ?? 'Cairo, Egypt'),
                                  20.vGap,
                                  PaymentInfoSection(paymentMethod: order.paymentMethod ?? 'Cash'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        40.vGap,
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}