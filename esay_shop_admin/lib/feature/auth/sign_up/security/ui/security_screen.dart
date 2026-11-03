import 'package:esay_shop_admin/feature/auth/sign_up/security/ui/widgets/desktop_security_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/security/ui/widgets/mobile_security_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/security/ui/widgets/tablet_security_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../../logic/sign_up_cubit.dart';
import '../logic/visibility_cubit.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjection.getIt<SignUpCubit>(),),
        BlocProvider(create: (_) => DependencyInjection.getIt<VisibilityCubit>()),
        BlocProvider(create: (_) => DependencyInjection.getIt<ImagePickerCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopSecurityScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletSecurityScreen();
          } else {
            return const MobileSecurityScreen();
          }
        },
      ),
    );
  }
}