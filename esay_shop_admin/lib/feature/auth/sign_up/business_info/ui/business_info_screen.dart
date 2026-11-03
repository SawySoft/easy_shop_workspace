import 'package:esay_shop_admin/feature/auth/sign_up/business_info/ui/widgets/desktop_business_info_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/business_info/ui/widgets/mobile_business_info_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/business_info/ui/widgets/tablet_business_info_screen.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../core/shred/logic/image_picker/image_picker_cubit.dart';

class BusinessInfoScreen extends StatelessWidget {
  const BusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: DependencyInjection.getIt<SignUpCubit>()),
        BlocProvider(create: (_) => DependencyInjection.getIt<ImagePickerCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopBusinessInfoScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletBusinessInfoScreen();
          } else {
            return const MobileBusinessInfoScreen();
          }
        },
      ),
    );
  }
}