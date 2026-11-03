import 'package:esay_shop/feature/profile/edit_profile/ui/screens/desktop_edit_profile_screen.dart';
import 'package:esay_shop/feature/profile/edit_profile/ui/screens/mobile_edit_profile_screen.dart';
import 'package:esay_shop/feature/profile/edit_profile/ui/screens/tablet_edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/shred/logic/image_picker/image_picker_cubit.dart';
import '../logic/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DependencyInjection.getIt<EditProfileCubit>()),
        BlocProvider(create: (_) => DependencyInjection.getIt<ImagePickerCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return const DesktopEditProfileScreen();
          } else if (constraints.maxWidth >= 600) {
            return const TabletEditProfileScreen();
          } else {
            return const MobileEditProfileScreen();
          }
        },
      ),
    );
  }
}

