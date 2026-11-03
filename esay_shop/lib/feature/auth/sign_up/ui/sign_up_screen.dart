
import 'package:esay_shop/feature/auth/sign_up/ui/screens/desktop_sign_up_screen.dart';
import 'package:esay_shop/feature/auth/sign_up/ui/screens/mobile_sign_up_screen.dart';
import 'package:esay_shop/feature/auth/sign_up/ui/screens/tablet_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../../../core/shred/logic/visibility_cubit.dart';
import '../logic/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<SignUpCubit>()),
        BlocProvider(create: (context) => DependencyInjection.getIt<VisibilityCubit>()),
        BlocProvider(create: (context) => DependencyInjection.getIt<ImagePickerCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopSignUpScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletSignUpScreen();
          } else {
            return const MobileSignUpScreen();
          }
        },
      ),
    );
  }
}
