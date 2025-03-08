import 'package:a_village/common/widgets/toggle_button.dart';
import 'package:a_village/features/blocked%20users/blocked_users_screen.dart';
import 'package:a_village/features/change%20password/change_password_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_slider.dart';
import '../../providers/language_provider.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  RangeValues _distancevalue = RangeValues(0, 80);
  RangeValues _agevalue = RangeValues(18, 40);

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Locale currentLocale =
            Provider.of<AppLanguageProvider>(context, listen: false).appLocal;
        String selectedLanguage = currentLocale.languageCode;

        return AlertDialog(
          backgroundColor: TColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.selectLanguage,
              style: TextStyle(
                fontSize: 20,
                color: TColors.black,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.interbold,
              ),
            ),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLanguageOption(
                    context,
                    title: AppLocalizations.of(context)!.english,
                    value: 'en',
                    selectedValue: selectedLanguage,
                    icon: Icons.language,
                    onSelect: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                  _buildLanguageOption(
                    context,
                    title: AppLocalizations.of(context)!.chinese,
                    value: 'zh',
                    selectedValue: selectedLanguage,
                    icon: Icons.translate,
                    onSelect: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: TextStyle(
                  color: TColors.placeholder,
                  fontFamily: AppFonts.interregular,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Provider.of<AppLanguageProvider>(context, listen: false)
                    .changeLanguage(Locale(selectedLanguage));
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.ok,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppFonts.interbold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String title,
    required String value,
    required String selectedValue,
    required IconData icon,
    required Function(String?) onSelect,
  }) {
    bool isSelected = value == selectedValue;

    return GestureDetector(
      onTap: () => onSelect(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color:
              isSelected ? TColors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? TColors.blue : TColors.stroke,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? TColors.blue : Colors.grey.shade700,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFonts.interregular,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? TColors.blue : TColors.black,
                ),
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: selectedValue,
              activeColor: TColors.blue,
              onChanged: onSelect,
            ),
          ],
        ),
      ),
    );
  }

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
                AppLocalizations.of(context)!.settings,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                AppLocalizations.of(context)!.discoverysettings,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 20,
                  color: TColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.yourlocation,
                    style: TextStyle(
                      fontFamily: AppFonts.interregular,
                      fontSize: 13,
                      color: TColors.placeholder,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.location,
                    style: TextStyle(
                      color: TColors.black,
                      fontFamily: AppFonts.interregular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.petion,
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interbold,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Image.asset(
                        ImageStrings.rightarrow,
                        height: 9.98,
                        width: 5.98,
                      ),
                    ],
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
                height: 23,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.maxdistance,
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interregular,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${_distancevalue.start.toInt()} - ${_distancevalue.end.toInt()} miles",
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interbold,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DistanceSlider(
                values: _distancevalue,
                onChanged: (value) {
                  setState(() {
                    _distancevalue = value;
                  });
                },
                activeColor: TColors.blue,
                inactiveColor: TColors.slidergrey,
                textColor: TColors.blue,
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 1,
                color: TColors.settingsdivider,
              ),
              SizedBox(
                height: 23,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.agerange,
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interregular,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${_agevalue.start.toInt()} - ${_agevalue.end.toInt()}",
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interbold,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DistanceSlider(
                values: _agevalue,
                onChanged: (value) {
                  setState(() {
                    _agevalue = value;
                  });
                },
                activeColor: TColors.blue,
                inactiveColor: TColors.slidergrey,
                textColor: TColors.blue,
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 1,
                color: TColors.settingsdivider,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                AppLocalizations.of(context)!.langsettings,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 20,
                  color: TColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.changelang,
                    style: TextStyle(
                      fontFamily: AppFonts.interregular,
                      fontSize: 13,
                      color: TColors.placeholder,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(
                      color: TColors.black,
                      fontFamily: AppFonts.interregular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showLanguageDialog(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          Provider.of<AppLanguageProvider>(context)
                                      .appLocal
                                      .languageCode ==
                                  'en'
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.chinese,
                          style: TextStyle(
                            color: TColors.blue,
                            fontFamily: AppFonts.interbold,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Image.asset(
                          ImageStrings.rightarrow,
                          height: 9.98,
                          width: 5.98,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                AppLocalizations.of(context)!.contact,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 20,
                  color: TColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.contact,
                    style: TextStyle(
                      color: TColors.black,
                      fontFamily: AppFonts.interregular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.asset(
                    ImageStrings.rightarrow,
                    height: 9.98,
                    width: 5.98,
                  ),
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                AppLocalizations.of(context)!.security,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 20,
                  color: TColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.changepass,
                      style: TextStyle(
                        color: TColors.black,
                        fontFamily: AppFonts.interregular,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(
                      ImageStrings.rightarrow,
                      height: 9.98,
                      width: 5.98,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Divider(
                height: 1,
                color: TColors.settingsdivider,
              ),
              SizedBox(
                height: 23,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlockedUsersScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.blockedusers,
                      style: TextStyle(
                        color: TColors.black,
                        fontFamily: AppFonts.interregular,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(
                      ImageStrings.rightarrow,
                      height: 9.98,
                      width: 5.98,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Divider(
                height: 1,
                color: TColors.settingsdivider,
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.terms,
                    style: TextStyle(
                      color: TColors.black,
                      fontFamily: AppFonts.interregular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.asset(
                    ImageStrings.rightarrow,
                    height: 9.98,
                    width: 5.98,
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
                height: 32,
              ),
              Text(
                AppLocalizations.of(context)!.managenoti,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 20,
                  color: TColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.emailnoti,
                    style: TextStyle(
                      color: TColors.black,
                      fontFamily: AppFonts.interregular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  AnimatedToggle(
                    onToggleCallback: (value) {
                      setState(
                        () {},
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.smsnoti,
                    style: TextStyle(
                      color: TColors.black,
                      fontFamily: AppFonts.interregular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  AnimatedToggle(
                    onToggleCallback: (value) {
                      setState(
                        () {},
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
