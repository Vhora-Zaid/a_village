import 'package:a_village/features/register/verification_screen.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_textfield.dart';
import '../../utils/app_validators/all_validators.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.alreadyhaveanaccount,
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
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.login,
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
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 100, bottom: 62),
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
                AppLocalizations.of(context)!.register,
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
                      controller: nameController,
                      imagePath: ImageStrings.userlogo,
                      suffixImage: null,
                      hintText: AppLocalizations.of(context)!.name,
                      validator: (value) =>
                          AllValidators.validateName(value, context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      controller: numberController,
                      imagePath: ImageStrings.mobile,
                      suffixImage: null,
                      hintText: AppLocalizations.of(context)!.mobile,
                      validator: (value) =>
                          AllValidators.validatePhoneNumber(value, context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                      obscureText: false,
                      hintText: AppLocalizations.of(context)!.password,
                      validator: (value) =>
                          AllValidators.validatePassword(value, context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      controller: confirmPasswordController,
                      imagePath: ImageStrings.password,
                      suffixImage: ImageStrings.eyeclose,
                      obscureText: false,
                      hintText: AppLocalizations.of(context)!.confirmpassword,
                      validator: (value) =>
                          AllValidators.validatePassword(value, context),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AppButton(
                title: AppLocalizations.of(context)!.register,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(),
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
