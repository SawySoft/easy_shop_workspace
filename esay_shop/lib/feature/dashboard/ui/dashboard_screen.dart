import 'package:esay_shop/feature/dashboard/ui/widgets/screens/desktop_dashboard_screen.dart';
import 'package:esay_shop/feature/dashboard/ui/widgets/screens/mobile_dashboard_screen.dart';
import 'package:esay_shop/feature/dashboard/ui/widgets/screens/tablet_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../home/logic/home_cubit.dart';
import '../logic/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<HomeCubit>()),
        BlocProvider(create: (context) => DependencyInjection.getIt<DashboardCubit>()),
      ],
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

