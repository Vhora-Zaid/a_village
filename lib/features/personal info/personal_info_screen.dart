import 'package:a_village/utils/constants/colors.dart';
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
              Text('Full Name'),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
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
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff989898),
                    fontFamily: AppFonts.interregular,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Mobile Number'),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
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
                  hintText: 'Mobile Number',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff989898),
                    fontFamily: AppFonts.interregular,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Email Address'),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
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
                  hintText: 'georgia.young@example.com',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff989898),
                    fontFamily: AppFonts.interregular,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Date of Birth'),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
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
                  hintText: '15/08/1995',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff989898),
                    fontFamily: AppFonts.interregular,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
