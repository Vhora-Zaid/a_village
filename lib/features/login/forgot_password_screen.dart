import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_textfield.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_button.dart';
import '../../utils/app_validators/all_validators.dart';
import '../../utils/constants/app_fonts.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
          padding: const EdgeInsets.only(left: 32, right: 32, top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageStrings.applogo,
                height: 129.33,
                width: 141.64,
              ),
              SizedBox(
                height: 39.67,
              ),
              Text(
                AppLocalizations.of(context)!.forgotPassword,
                style: TextStyle(
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                AppLocalizations.of(context)!.enteryouremail,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  color: TColors.grey,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: AppTextField.simpleTextField(
                  controller: emailController,
                  imagePath: ImageStrings.email,
                  suffixImage: null,
                  hintText: AppLocalizations.of(context)!.email,
                  validator: (value) =>
                      AllValidators.validateEmail(value, context),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              AppButton(
                title: AppLocalizations.of(context)!.submit,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
