import 'package:flutter/material.dart';
import '../../common/widgets/notification_tile.dart';
import '../../models/notification_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> dummyNotifications = [
      NotificationModel(
        userName: "Sophie",
        message: "Liked your profile",
        avatarUrl: ImageStrings.profile1,
        timeAgo: "2h ago",
        isNew: true,
      ),
      NotificationModel(
        userName: "Emma",
        message: "Sent you a message",
        avatarUrl: ImageStrings.profile2,
        timeAgo: "5h ago",
        isNew: true,
      ),
      NotificationModel(
        userName: "James",
        message: "Visited your profile",
        avatarUrl: ImageStrings.profile3,
        timeAgo: "2 days ago",
        isNew: false,
      ),
      NotificationModel(
        userName: "Olivia",
        message: "Matched with you",
        avatarUrl: ImageStrings.profile4,
        timeAgo: "3 days ago",
        isNew: false,
      ),
    ];

    final newNotis = dummyNotifications.where((n) => n.isNew).toList();
    final oldNotis = dummyNotifications.where((n) => !n.isNew).toList();

    return Scaffold(
      backgroundColor: TColors.white,
      appBar: AppBar(
        backgroundColor: TColors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              ImageStrings.backarrow,
              height: 44,
              width: 44,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.noti,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              if (newNotis.isNotEmpty) ...[
                Text(
                  AppLocalizations.of(context)!.newnoti,
                  style: TextStyle(
                    fontSize: 16,
                    color: TColors.blue,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.interregular,
                  ),
                ),
                const SizedBox(height: 10),
                ...newNotis.map((n) => NotificationTile(notification: n)),
              ],
              if (oldNotis.isNotEmpty) ...[
                const SizedBox(height: 5),
                const Divider(color: TColors.stroke),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.earlier,
                  style: TextStyle(
                    fontSize: 16,
                    color: TColors.blue,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.interregular,
                  ),
                ),
                const SizedBox(height: 10),
                ...oldNotis.map((n) => NotificationTile(notification: n)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
