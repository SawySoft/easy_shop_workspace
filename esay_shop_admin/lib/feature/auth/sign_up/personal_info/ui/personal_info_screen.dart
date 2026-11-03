import 'package:esay_shop_admin/feature/auth/sign_up/personal_info/ui/widgets/desktop_personal_info_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/personal_info/ui/widgets/mobile_personal_info_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/personal_info/ui/widgets/tablet_personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../logic/sign_up_cubit.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjection.getIt<SignUpCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return  DesktopPersonalInfoScreen();
          } else if (constraints.maxWidth >= 600) {
            return  TabletPersonalInfoScreen();
          } else {
            return  MobilePersonalInfoScreen();
          }
        },
      ),
    );
  }
}