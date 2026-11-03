import 'package:easy_localization/easy_localization.dart';
import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../app/theming/app_colors.dart';
import '../../../../../../core/shred/data/admin_response_model.dart';
import '../../../../../../core/shred/ui/profile-info_card.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/profile_details_cubit.dart';
import '../custom_logout_button.dart';
import '../profile_menu_card.dart';

class MobileProfileScreen extends StatelessWidget {
  const MobileProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientData = Bingo.call<ClientResponseModel>("client_data");
    final ThemeData theme = Theme.of(context);
    return BlocConsumer<ProfileDetailsCubit, ProfileDetailsState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            if ( message.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message.tr()), backgroundColor: AppColors.green),
              );
            }
            Navigator.of(context).pushReplacementNamed(AppRoutes.signIn.route);
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('error_prefix'.tr(namedArgs: {'message': message}))),
            );
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(title: Text('profile_title'.tr())),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        ProfileInfoCard(clientData: clientData),
                        16.vGap,
                        const ProfileMenuCard(),
                        16.vGap,
                        state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          orElse: () => CustomLogoutButton(
                            text: "logout_button".tr(),
                            onPressed: () {
                              context.read<ProfileDetailsCubit>().logout();
                            },
                          ),
                        ),
                        24.vGap,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}