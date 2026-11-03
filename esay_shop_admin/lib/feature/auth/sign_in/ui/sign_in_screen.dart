import 'package:esay_shop_admin/core/dependency_injection/dependency_injection.dart';
import 'package:esay_shop_admin/feature/auth/sign_in/ui/widgets/desktop_sign_in_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_in/ui/widgets/mobile_sign_in_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_in/ui/widgets/tablet_sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sign_up/security/logic/visibility_cubit.dart';
import '../logic/sign_in_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<SignInCubit>(),),
        BlocProvider(create: (_) => DependencyInjection.getIt<VisibilityCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopSignInScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletSignInScreen();
          } else {
            return const MobileSignInScreen();
          }
        },
      ),
    );
  }
}