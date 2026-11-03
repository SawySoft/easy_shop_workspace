import 'package:esay_shop/feature/home/ui/widgets/screens/desktop_home_screen.dart';
import 'package:esay_shop/feature/home/ui/widgets/screens/mobile_home_screen.dart';
import 'package:esay_shop/feature/home/ui/widgets/screens/tablet_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/shred/logic/favorite/favorite_cubit.dart';
import '../logic/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<HomeCubit>()),
        BlocProvider(create: (context) => DependencyInjection.getIt<FavoriteCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopHomeScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletHomeScreen();
          } else {
            return const MobileHomeScreen();
          }
        },
      ),
    );
  }
}

