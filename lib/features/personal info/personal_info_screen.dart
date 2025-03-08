import 'package:a_village/common/widgets/app_button.dart';
import 'package:a_village/common/widgets/interest_selection.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (kDebugMode) {
  //     emailController.text = 'georgia.young@example.com';
  //     numberController.text = '+1 98980 98980';
  //     nameController.text = 'Wade Warren';
  //     dobController.text = '15/08/1995';
  //   }
  // }

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
                AppLocalizations.of(context)!.personalinfo,
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
                AppLocalizations.of(context)!.name,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  color: TColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                cursorColor: Color(0xff3E1D0D),
                controller: nameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(16, 10, 11, 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.red, width: 0.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.red, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xffDBDDE2),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xffDBDDE2),
                      width: 1.0,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Wade Warren',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: TColors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.interregular,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.mobile,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  color: TColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                controller: numberController,
                cursorColor: Color(0xff3E1D0D),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(16, 10, 11, 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.red, width: 0.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.red, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Color(0xffDBDDE2),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Color(0xffDBDDE2),
                      width: 1.0,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  hintText: '+1 98980 98980',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: TColors.hintcolor,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.interregular,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.emailaddress,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  color: TColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: Color(0xff3E1D0D),
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(16, 10, 11, 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.red, width: 0.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.red, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Color(0xffDBDDE2),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Color(0xffDBDDE2),
                      width: 1.0,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  hintText: 'georgia.young@example.com',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: TColors.hintcolor,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.interregular,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.dob,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  color: TColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: TColors.blue.withOpacity(0.3),
                            onPrimary: TColors.black,
                            onSurface: TColors.black,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: TColors.blue,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    dobController.text =
                        '${picked.day}/${picked.month}/${picked.year}';
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Color(0xff3E1D0D),
                    controller: dobController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 10, 11, 15),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.red, width: 0.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.red, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xffDBDDE2),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xffDBDDE2),
                          width: 1.0,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      hintText: '15/08/1995',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: TColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.interregular,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.gender,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  color: TColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              GenderSelection(),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.interest,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  color: TColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              InterestsSelection(),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.writesomething,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  color: TColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                cursorColor: TColors.placeholder,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.lorem,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: TColors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color(0xffDBDDE2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color(0xffDBDDE2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color(0xffDBDDE2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 20),
        child: AppButton(
          title: AppLocalizations.of(context)!.save,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
