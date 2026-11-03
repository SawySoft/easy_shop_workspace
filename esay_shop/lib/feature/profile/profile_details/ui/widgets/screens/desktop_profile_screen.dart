import 'package:easy_localization/easy_localization.dart';
import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../core/shred/data/admin_response_model.dart';
import '../../../../../../core/shred/ui/profile-info_card.dart';
import '../../../../../../core/utils/extensions/num_extensions.dart';
import '../../../logic/profile_details_cubit.dart';
import '../custom_logout_button.dart';
import '../profile_menu_card.dart';

class DesktopProfileScreen extends StatelessWidget {
  const DesktopProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientData = Bingo.call<ClientResponseModel>("client_data");
    final ThemeData theme = Theme.of(context);
    return BlocConsumer<ProfileDetailsCubit, ProfileDetailsState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            // رسالة النجاح القادمة من الـ Cubit يتم ترجمتها
            if (message != null && message.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message.tr()), backgroundColor: Colors.green),
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
          appBar: AppBar(title: Text('profile_title'.tr()), centerTitle: true),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: ProfileInfoCard(clientData: clientData),
                  ),
                  40.hGap,
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("account_settings_title".tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 26)),
                        24.vGap,
                        const ProfileMenuCard(),
                        32.vGap,
                        state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          orElse: () => SizedBox(
                            width: double.infinity,
                            child: CustomLogoutButton(
                              text: "logout_button".tr(),
                              onPressed: () {
                                context.read<ProfileDetailsCubit>().logout();
                              },
                            ),
                          ),
                        ),
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