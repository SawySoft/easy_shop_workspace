import 'package:esay_shop_admin/feature/dashboard/ui/widgets/desktop_dashboard_screen.dart';
import 'package:esay_shop_admin/feature/dashboard/ui/widgets/mobile_dashboard_screen.dart';
import 'package:esay_shop_admin/feature/dashboard/ui/widgets/tablet_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esay_shop_admin/feature/dashboard/logic/dashboard_cubit.dart';

import '../../../core/dependency_injection/dependency_injection.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<DashboardCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopDashboardScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletDashboardScreen();
          } else {
            return const MobileDashboardScreen();
          }
        },
      ),
    );
  }
}
