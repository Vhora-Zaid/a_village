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
        title: "Ava liked your profile",
        subtitle: ' Maybe its a match!',
        avatarUrl: ImageStrings.profile1,
        timeAgo: '2h ago',
      ),
      NotificationModel(
        title: "Liam sent you a message",
        subtitle: '\"Hey, how’s it going? 👋\"',
        avatarUrl: ImageStrings.profile2,
        timeAgo: '5h ago',
      ),
      NotificationModel(
        title: "Emma viewed your profile.",
        subtitle: 'Someone’s curious! 😉',
        avatarUrl: ImageStrings.profile3,
        timeAgo: '2 days ago',
      ),
      NotificationModel(
        title: "You and Noah are a match!",
        subtitle: 'Say hi and start chatting.',
        avatarUrl: ImageStrings.profile4,
        timeAgo: '3 days ago',
      ),
    ];


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
              ...dummyNotifications.map((n) => NotificationTile(notification: n)),
            ],
          ),
        ),
      ),
    );
  }
}