// lib/features/notification/widgets/notification_tile.dart

import 'package:flutter/material.dart';
import '../../../models/notification_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/app_fonts.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(notification.avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.interregular,
                    color: TColors.black,
                  ),
                ),
                Text(
                  notification.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.interregular,
                    color: TColors.placeholder,
                  ),
                ),
              ],
            ),
          ),
          Text(
            notification.timeAgo,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: AppFonts.interregular,
              color: TColors.placeholder,
            ),
          ),
        ],
      ),
    );
  }
}
