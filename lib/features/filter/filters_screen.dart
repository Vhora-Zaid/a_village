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

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _distancevalues = RangeValues(20, 40);
  RangeValues _agevalues = RangeValues(18, 35);

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
              child: Text(
                AppLocalizations.of(context)!.clear,
                style: TextStyle(
                  color: TColors.blue,
                  fontSize: 14,
                  fontFamily: AppFonts.interregular,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.filter,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                AppLocalizations.of(context)!.preference,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  color: TColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PreferenceSelection(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.interest,
                    style: TextStyle(
                      fontFamily: AppFonts.interregular,
                      fontSize: 15,
                      color: TColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppLocalizations.of(context)!.selectall,
                      style: TextStyle(
                        fontFamily: AppFonts.interregular,
                        fontSize: 14,
                        color: TColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InterestFilterSelection(),
              SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context)!.viewall,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  color: TColors.blue,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.distance,
                        style: TextStyle(
                          fontFamily: AppFonts.interregular,
                          fontSize: 15,
                          color: TColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${_distancevalues.start.toInt()} - ${_distancevalues.end.toInt()} miles",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              DistanceSlider(
                values: _distancevalues,
                onChanged: (value) {
                  setState(() {
                    _distancevalues = value;
                  });
                },
                activeColor: TColors.yellow,
                inactiveColor: TColors.slidergrey,
                textColor: TColors.blue,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.agerange,
                        style: TextStyle(
                          fontFamily: AppFonts.interregular,
                          fontSize: 15,
                          color: TColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${_agevalues.start.toInt()} - ${_agevalues.end.toInt()}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              DistanceSlider(
                values: _agevalues,
                onChanged: (value) {
                  setState(() {
                    _agevalues = value;
                  });
                },
                activeColor: TColors.yellow,
                inactiveColor: TColors.slidergrey,
                textColor: TColors.blue,
              ),
              SizedBox(
                height: 121,
              ),
              AppButton(
                title: AppLocalizations.of(context)!.apply,
                onTap: () {
                 Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
