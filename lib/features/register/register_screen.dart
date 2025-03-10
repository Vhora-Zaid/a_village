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
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String selectedCountryCode = "+1";
  List<Map<String, dynamic>> countryData = [
    {'code': '+91', 'name': 'India', 'flag': '🇮🇳', 'regex': r'^[6-9]\d{9}$'},
    {'code': '+1', 'name': 'USA', 'flag': '🇺🇸', 'regex': r'^\d{10}$'},
    {'code': '+44', 'name': 'UK', 'flag': '🇬🇧', 'regex': r'^\d{10}$'},
    {
      'code': '+61',
      'name': 'Australia',
      'flag': '🇦🇺',
      'regex': r'^[4]\d{8}$'
    },
    {'code': '+49', 'name': 'Germany', 'flag': '🇩🇪', 'regex': r'^\d{10,11}$'},
    {'code': '+33', 'name': 'France', 'flag': '🇫🇷', 'regex': r'^[67]\d{8}$'},
    {'code': '+81', 'name': 'Japan', 'flag': '🇯🇵', 'regex': r'^\d{9,10}$'},
    {
      'code': '+82',
      'name': 'South Korea',
      'flag': '🇰🇷',
      'regex': r'^\d{9,10}$'
    },
    {'code': '+86', 'name': 'China', 'flag': '🇨🇳', 'regex': r'^\d{11}$'},
    {'code': '+39', 'name': 'Italy', 'flag': '🇮🇹', 'regex': r'^[3]\d{9}$'},
    {'code': '+7', 'name': 'Russia', 'flag': '🇷🇺', 'regex': r'^\d{10}$'},
    {'code': '+55', 'name': 'Brazil', 'flag': '🇧🇷', 'regex': r'^\d{10,11}$'},
    {
      'code': '+27',
      'name': 'South Africa',
      'flag': '🇿🇦',
      'regex': r'^[678]\d{8}$'
    },
    {'code': '+34', 'name': 'Spain', 'flag': '🇪🇸', 'regex': r'^[67]\d{8}$'},
    {'code': '+52', 'name': 'Mexico', 'flag': '🇲🇽', 'regex': r'^[1-9]\d{9}$'},
    {'code': '+971', 'name': 'UAE', 'flag': '🇦🇪', 'regex': r'^[5]\d{8}$'},
    {
      'code': '+966',
      'name': 'Saudi Arabia',
      'flag': '🇸🇦',
      'regex': r'^[5]\d{8}$'
    },
    {'code': '+90', 'name': 'Turkey', 'flag': '🇹🇷', 'regex': r'^[5]\d{9}$'},
    {
      'code': '+31',
      'name': 'Netherlands',
      'flag': '🇳🇱',
      'regex': r'^[6]\d{8}$'
    },
    {'code': '+46', 'name': 'Sweden', 'flag': '🇸🇪', 'regex': r'^[7]\d{8}$'},
    {
      'code': '+41',
      'name': 'Switzerland',
      'flag': '🇨🇭',
      'regex': r'^[7]\d{8}$'
    },
    {'code': '+32', 'name': 'Belgium', 'flag': '🇧🇪', 'regex': r'^[4]\d{8}$'},
    {
      'code': '+351',
      'name': 'Portugal',
      'flag': '🇵🇹',
      'regex': r'^[9]\d{8}$'
    },
    {
      'code': '+64',
      'name': 'New Zealand',
      'flag': '🇳🇿',
      'regex': r'^[2]\d{8,9}$'
    },
    {'code': '+20', 'name': 'Egypt', 'flag': '🇪🇬', 'regex': r'^[1]\d{9}$'},
    {
      'code': '+234',
      'name': 'Nigeria',
      'flag': '🇳🇬',
      'regex': r'^[789]\d{9}$'
    },
    {
      'code': '+63',
      'name': 'Philippines',
      'flag': '🇵🇭',
      'regex': r'^[9]\d{9}$'
    },
    {
      'code': '+66',
      'name': 'Thailand',
      'flag': '🇹🇭',
      'regex': r'^[689]\d{8}$'
    },
    {'code': '+98', 'name': 'Iran', 'flag': '🇮🇷', 'regex': r'^[9]\d{9}$'},
    {
      'code': '+62',
      'name': 'Indonesia',
      'flag': '🇮🇩',
      'regex': r'^[8]\d{9,10}$'
    },
  ];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
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
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 100),
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
                    PhoneTextField(
                      phoneController: phoneController,
                      countryData: countryData,
                      initialCountryCode: selectedCountryCode,
                      onCountryCodeChanged: (code) {
                        setState(
                          () {
                            selectedCountryCode = code;
                          },
                        );
                      },
                      validator: (value, countryCode) =>
                          AllValidators.validatePhoneNumber(
                              value, countryCode, countryData),
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
                          AllValidators.validateConfirmPassword(
                              value, passwordController.text, context),
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
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState?.validate() ?? false) {
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
