import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/home_cubit.dart';
import '../desktop_stat_card.dart';
import '../home_header_widget.dart';
import '../products_overview_section.dart';
import '../quick_actions_section.dart';
import '../recent_orders_section.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.orange),
            ),
            success: (dashboardData) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeaderWidget(greeting: cubit.getGreeting()),
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DesktopStatsGrid(data: dashboardData),
                          28.vGap,
                          const QuickActionsSection(),
                          28.vGap,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                child: RecentOrdersSection(orders: dashboardData.recentOrders),
                              ),
                              24.hGap,
                              Expanded(
                                flex: 6,
                                child: ProductsOverviewSection(products: dashboardData.productsOverview),
                              ),
                            ],
                          ),
                          40.vGap,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            failure: (message) => Center(
              child: Text(
                'error_prefix'.tr(namedArgs: {'message': message.tr()}),
                style: const TextStyle(color: AppColors.red, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}