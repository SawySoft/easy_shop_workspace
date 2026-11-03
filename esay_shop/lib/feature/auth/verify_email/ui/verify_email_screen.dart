import 'package:esay_shop/feature/auth/verify_email/ui/widgets/screens/desktop_verify_email_screen.dart';
import 'package:esay_shop/feature/auth/verify_email/ui/widgets/screens/mobile_verify_email_screen.dart';
import 'package:esay_shop/feature/auth/verify_email/ui/widgets/screens/tablet_verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../logic/verify_email_cubit.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;

  const VerifyEmailScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => DependencyInjection.getIt<VerifyEmailCubit>(param1: email))],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopVerifyEmailScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletVerifyEmailScreen();
          } else {
            return const MobileVerifyEmailScreen();
          }
        },
      ),
    );
  }
}
