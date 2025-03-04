import 'package:a_village/features/personal%20info/personal_info_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.editprofile,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    
                  ),
                  // Container(
                  //   height: 192,
                  //   decoration: BoxDecoration(
                  //     color: TColors.placeholder,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // Container(
                  //   height: 91,
                  //   decoration: BoxDecoration(
                  //     color: TColors.placeholder,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.personalinfo,
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interregular,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalInfoScreen()));
                        },
                        child: Image.asset(
                          ImageStrings.editicon,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Divider(
                    height: 1,
                    color: TColors.settingsdivider,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.myinterest,
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interregular,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Image.asset(
                        ImageStrings.editicon,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Divider(
                    height: 1,
                    color: TColors.settingsdivider,
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
