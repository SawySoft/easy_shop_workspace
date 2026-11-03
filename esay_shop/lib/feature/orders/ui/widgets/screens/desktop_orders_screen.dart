import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/orders_cubit.dart';
import '../order_card.dart';

class DesktopOrdersScreen extends StatelessWidget {
  const DesktopOrdersScreen({super.key});

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
            failure: (message) => Center(child: Text('error_prefix'.tr(namedArgs: {'message': message}), style: const TextStyle(fontSize: 16))),
            success: (orders) {
              if (orders.isEmpty) {
                return Center(
                  child: Text('no_orders_yet'.tr(), style: const TextStyle(fontSize: 18, color: AppColors.grey)),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('order_history'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
                    24.vGap,
                    Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 2.3,
                        ),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          final order = orders[index];
                          return OrderCard(order: order);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}