import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/interest_selection.dart';
import 'package:a_village/features/discover/discover_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_slider.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
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
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              // child: Text(
              //   AppLocalizations.of(context)!.clear,
              //   style: TextStyle(
              //     color: TColors.blue,
              //     fontSize: 14,
              //     fontFamily: AppFonts.interregular,
              //   ),
              // ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, bottom: 10),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.newnoti,
                    style: TextStyle(
                      color: TColors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.interregular,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: TColors.stroke,
                              radius: 20,
                              backgroundImage: AssetImage(ImageStrings.profile7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.cody,
                                  style: TextStyle(
                                    color: TColors.black,
                                    fontSize: 14,
                                    fontFamily: AppFonts.interregular,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    AppLocalizations.of(context)!.lorem,
                                    style: TextStyle(
                                      color: TColors.placeholder,
                                      fontSize: 12,
                                      fontFamily: AppFonts.interregular,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '2h ago',
                              style: TextStyle(
                                color: TColors.placeholder,
                                fontSize: 12,
                                fontFamily: AppFonts.interregular,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    color: TColors.stroke,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.oldnoti,
                    style: TextStyle(
                      color: TColors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.interregular,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: TColors.stroke,
                              radius: 20,
                              backgroundImage: AssetImage(ImageStrings.profile9),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.arthur,
                                  style: TextStyle(
                                    color: TColors.black,
                                    fontSize: 14,
                                    fontFamily: AppFonts.interregular,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    AppLocalizations.of(context)!.lorem,
                                    style: TextStyle(
                                      color: TColors.placeholder,
                                      fontSize: 12,
                                      fontFamily: AppFonts.interregular,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '2 Days ago',
                              style: TextStyle(
                                color: TColors.placeholder,
                                fontSize: 12,
                                fontFamily: AppFonts.interregular,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
