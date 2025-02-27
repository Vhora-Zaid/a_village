import 'package:a_village/features/settings/settings_screen.dart';
import 'package:a_village/features/subscription/subscription_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> profileIcons = [
    ImageStrings.editprofile,
    ImageStrings.matches,
    ImageStrings.wholikesyou,
    ImageStrings.yourlikes,
    ImageStrings.subscription,
    ImageStrings.settings,
    ImageStrings.support,
    ImageStrings.privacy,
    ImageStrings.logout,
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      AppLocalizations.of(context)!.editprofile,
      AppLocalizations.of(context)!.matches,
      AppLocalizations.of(context)!.wholikesyou,
      AppLocalizations.of(context)!.yourlikes,
      AppLocalizations.of(context)!.subscription,
      AppLocalizations.of(context)!.settings,
      AppLocalizations.of(context)!.support,
      AppLocalizations.of(context)!.privacy,
      AppLocalizations.of(context)!.logout
    ];

    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
        color: TColors.black,
        fontSize: 27,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                ImageStrings.notificationlogo,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Container(
                    height: 103,
                    width: 103,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(ImageStrings.profile9),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 19,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.arthur,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.interregular,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            AppLocalizations.of(context)!.robertson,
                            style: TextStyle(
                              color: TColors.lastname,
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.interregular,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '345',
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.interbold,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.likes,
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 13,
                                  fontFamily: AppFonts.interregular,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 62,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '15',
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.interbold,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.matched,
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 13,
                                  fontFamily: AppFonts.interregular,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 35),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, '/editprofile');
                    }
                    if (index == 1) {
                      Navigator.pushNamed(context, '/matches');
                    }
                    if (index == 2) {
                      Navigator.pushNamed(context, '/wholikesyou');
                    }
                    if (index == 3) {
                      Navigator.pushNamed(context, '/yourlikes');
                    }
                    if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubscriptionScreen(),
                        ),
                      );
                    }
                    if (index == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    }
                    if (index == 6) {
                      Navigator.pushNamed(context, '/support');
                    }
                    if (index == 7) {
                      Navigator.pushNamed(context, '/privacy');
                    }
                    if (index == 8) {
                      Navigator.pushNamed(context, '/logout');
                    }
                  },
                  child: ListTile(
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            profileIcons[index % profileIcons.length],
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      names[index],
                      style: const TextStyle(
                        fontFamily: AppFonts.interregular,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    shape: Border(
                      bottom: BorderSide(
                        color: TColors.stroke,
                        width: 1.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
