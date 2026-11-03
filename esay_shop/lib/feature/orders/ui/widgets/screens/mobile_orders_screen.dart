import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/orders_cubit.dart';
import '../order_card.dart';

class MobileOrdersScreen extends StatelessWidget {
  const MobileOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text('orders_title'.tr()),
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => Center(
              child: Text('error_prefix'.tr(namedArgs: {'message': message})),
            ),
            success: (orders) {
              if (orders.isEmpty) {
                return Center(
                  child: Text('no_orders_yet'.tr()),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                itemCount: orders.length,
                separatorBuilder: (context, index) => 12.vGap,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderCard(order: order);
                },
              );
            },
          );
        },
      ),
    );
  }
}