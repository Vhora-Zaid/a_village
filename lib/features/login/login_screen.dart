import 'dart:io';

import 'package:a_village/common/widgets/app_bottomnavigation.dart';
import 'package:a_village/common/widgets/app_textfield.dart';
import 'package:a_village/features/register/register_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_button.dart';
import '../../utils/app_validators/all_validators.dart';
import '../../utils/constants/app_fonts.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  int index = 0;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kDebugMode) {
      emailController.text = 'abc@example.com';
      passwordController.text = 'Abc@1234567';
    }
  }

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.donthaveanaccount,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xff3E1D0D),
                fontFamily: AppFonts.interregular,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.register,
                style: TextStyle(
                  fontFamily: AppFonts.interbold,
                  fontSize: 15,
                  color: TColors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
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
                height: 21.67,
              ),
              Text(
                AppLocalizations.of(context)!.login,
                style: TextStyle(
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: emailController,
                      imagePath: ImageStrings.email,
                      suffixImage: null,
                      hintText: AppLocalizations.of(context)!.email,
                      validator: (value) =>
                          AllValidators.validateEmail(value, context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      controller: passwordController,
                      imagePath: ImageStrings.password,
                      suffixImage: ImageStrings.eyeclose,
                      hintText: AppLocalizations.of(context)!.password,
                      obscureText: false,
                      validator: (value) =>
                          AllValidators.validateLoginPassword(value, context),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.forgotPassword,
                  style: TextStyle(
                    fontFamily: AppFonts.interbold,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: TColors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              AppButton(
                title: AppLocalizations.of(context)!.login,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppBottomNavBar(
                          currentIndex: 0,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 58,
              ),
              Text(AppLocalizations.of(context)!.loginwith),
              SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      ImageStrings.google,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  if (Platform.isIOS)
                    GestureDetector(
                      child: Image.asset(
                        ImageStrings.apple,
                        height: 50,
                        width: 50,
                      ),
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
