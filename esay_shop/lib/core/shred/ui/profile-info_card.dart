import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';


import '../data/admin_response_model.dart';
import 'ProfileAvatar.dart';

class ProfileInfoCard extends StatelessWidget {
  final VoidCallback? onTap;
  final ClientResponseModel? clientData;

  const ProfileInfoCard({super.key, this.clientData, this.onTap});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ProfileAvatar(
              clientData: clientData,
              size: 60,
            ),
            16.hGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    clientData?.name ?? 'No Name',
                    style: theme.textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.vGap,
                  Text(
                    clientData?.email ?? '',
                    style: theme.textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    clientData?.phone ?? '',
                    style: theme.textTheme.headlineMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}