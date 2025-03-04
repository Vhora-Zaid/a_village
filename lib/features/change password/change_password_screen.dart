import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_button.dart';
import 'package:a_village/common/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_validators/all_validators.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

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
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.changepass,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 26.77,
              ),
              Center(
                child: Image.asset(
                  ImageStrings.changepassword,
                  height: 183.26,
                  width: 185.96,
                ),
              ),
              SizedBox(
                height: 27.97,
              ),
              AppTextField(
                controller: currentPassController,
                imagePath: ImageStrings.password,
                suffixImage: ImageStrings.eyeclose,
                obscureText: true,
                hintText: AppLocalizations.of(context)!.currentpass,
                validator: (value) =>
                    AllValidators.validatePassword(value, context),
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: newPassController,
                imagePath: ImageStrings.password,
                suffixImage: ImageStrings.eyeclose,
                obscureText: false,
                hintText: AppLocalizations.of(context)!.newpass,
                validator: (value) =>
                    AllValidators.validatePassword(value, context),
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: newPassController,
                imagePath: ImageStrings.password,
                suffixImage: ImageStrings.eyeclose,
                obscureText: false,
                hintText: AppLocalizations.of(context)!.confirmnewpass,
                validator: (value) =>
                    AllValidators.validatePassword(value, context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: AppButton(
          title: AppLocalizations.of(context)!.resetpass,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
