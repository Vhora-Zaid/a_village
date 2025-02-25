import 'package:a_village/common/widgets/interest_selection.dart';
import 'package:a_village/features/register/set_preferences_screen.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_button.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/app_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YourInterestsScreen extends StatefulWidget {
  const YourInterestsScreen({super.key});

  @override
  State<YourInterestsScreen> createState() => _YourInterestsScreenState();
}

class _YourInterestsScreenState extends State<YourInterestsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.yourinterests,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                AppLocalizations.of(context)!.lorem,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  color: Color(0xff6F778B),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              InterestSelection(),
              SizedBox(
                height: 64,
              ),
              AppButton(
                title: 'Continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetPreferencesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}