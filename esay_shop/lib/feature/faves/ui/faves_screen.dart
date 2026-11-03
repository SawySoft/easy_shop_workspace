import 'package:esay_shop/feature/faves/ui/widgets/screens/desktob_faves_screen.dart';
import 'package:esay_shop/feature/faves/ui/widgets/screens/mobile_faves_screen.dart';
import 'package:esay_shop/feature/faves/ui/widgets/screens/tablet_faves_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shred/logic/favorite/favorite_cubit.dart';
import '../../../core/dependency_injection/dependency_injection.dart';

class FavesScreen extends StatelessWidget {
  const FavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<FavoriteCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopFavesScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletFavesScreen();
          } else {
            return const MobileFavesScreen();
          }
        },
      ),
    );
  }
}

