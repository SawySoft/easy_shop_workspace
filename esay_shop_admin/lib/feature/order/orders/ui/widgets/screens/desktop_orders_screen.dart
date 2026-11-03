import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/theming/app_colors.dart';
import '../../../logic/orders_cubit.dart';
import '../order_card_item.dart';

class DesktopOrdersScreen extends StatelessWidget {
  const DesktopOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('orders_screen_title'.tr())),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.orange),
            ),
            success: (orders) {
              if (orders.isEmpty) {
                return Center(child: Text('orders_no_orders_found'.tr()));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(32),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2.6,
                ),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderCardItem(order: order);
                },
              );
            },
            failure: (message) => Center(
              child: Text(
                'error_prefix'.tr(namedArgs: {'message': message.tr()}),
                style: textTheme.labelLarge!.copyWith(color: AppColors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}