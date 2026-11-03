import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../logic/orders_cubit.dart';
import '../order_card.dart';

class TabletOrdersScreen extends StatelessWidget {
  const TabletOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(title: Text('orders_title'.tr()), centerTitle: true),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => Center(
              child: Text(
                'error_prefix'.tr(namedArgs: {'message': message}),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            success: (orders) {
              if (orders.isEmpty) {
                return Center(
                  child: Text(
                    'no_orders_yet'.tr(),
                    style: const TextStyle(fontSize: 16, color: AppColors.grey),
                  ),
                );
              }

              return Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 850),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(24),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return OrderCard(order: order);
                    },
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