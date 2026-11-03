import 'package:bingo/bingo.dart';
import 'package:esay_shop/app/router/app_routes.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../app/theming/app_colors.dart';
import '../../../../core/shred/data/admin_response_model.dart';
import '../../../../core/shred/ui/ProfileAvatar.dart';

class HomeHeader extends StatelessWidget {
  final String greeting;

  const HomeHeader({required this.greeting, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ClientResponseModel? client = Bingo.call<ClientResponseModel>("client_data");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            4.vGap,
            Row(
              children: [
                Text(client?.name ?? "", style: theme.textTheme.titleMedium),
                4.hGap,
                Text("👋", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor,
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8)],
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_outlined, color: AppColors.grey),
                onPressed: () {},
              ),
            ),
            8.hGap,
            ProfileAvatar(
              clientData: client,
              size: 50,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.profileDetails.route),
            ),
          ],
        ),
      ],
    );
  }
}
