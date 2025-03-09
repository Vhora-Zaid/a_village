import 'package:a_village/features/edit%20profile/edit_profile_screen.dart';
import 'package:a_village/features/login/login_screen.dart';
import 'package:a_village/features/privacy%20policy/privacy_policy_screen.dart';
import 'package:a_village/features/settings/settings_screen.dart';
import 'package:a_village/features/subscription/subscription_screen.dart';
import 'package:a_village/features/Matched/you_matched_screen.dart';
import 'package:a_village/features/support/support_screen.dart';
import 'package:a_village/features/who%20likes%20you/who_likes.dart';
import 'package:a_village/features/your%20likes/your_likes_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';
import '../matches/matches_screen.dart';

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
    ImageStrings.deleteaccount,
    ImageStrings.logout
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
      AppLocalizations.of(context)!.deleteaccount,
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
        physics: ClampingScrollPhysics(),
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
                                  color: Color(0xff707070),
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
                                  color: Color(0xff707070),
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 30),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MatchesScreen(),
                              ),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WhoLikesYou(),
                              ),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YourLikesScreen(),
                              ),
                            );
                            break;
                          case 4:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubscriptionScreen(),
                              ),
                            );
                            break;
                          case 5:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsScreen(),
                              ),
                            );
                            break;
                          case 6:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SupportScreen(),
                              ),
                            );
                            break;
                          case 7:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrivacyPolicyScreen(),
                              ),
                            );
                            break;
                          case 8:
                            showOkCancelAlertDialog(
                              context: context,
                              message: AppLocalizations.of(context)!.suredelete,
                              okButtonTitle:
                                  AppLocalizations.of(context)!.delete,
                              cancelButtonTitle:
                                  AppLocalizations.of(context)!.cancel,
                              cancelButtonAction: () {},
                              okButtonAction: () {
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => LoginScreen(),
                                //   ),
                                // );
                              },
                            );
                            break;
                          case 9:
                            showOkCancelAlertDialog(
                              context: context,
                              message: AppLocalizations.of(context)!.areyousure,
                              okButtonTitle: AppLocalizations.of(context)!.ok,
                              cancelButtonTitle:
                                  AppLocalizations.of(context)!.cancel,
                              cancelButtonAction: () {},
                              okButtonAction: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                            );
                            break;
                          default:
                        }
                      },
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
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: AppFonts.interregular,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Divider(
                        color: TColors.stroke,
                        thickness: 1,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
