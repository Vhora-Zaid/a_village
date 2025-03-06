import 'dart:async';
import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/features/register/complete_profile.dart';
import 'package:a_village/features/register/register_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_textfield.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  int _secondsRemaining = 60;
  Timer? _timer;
  bool _isTimerActive = true;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_secondsRemaining > 0) {
          setState(() {
            _secondsRemaining--;
          });
        } else {
          setState(() {
            _isTimerActive = false;
          });
          timer.cancel();
        }
      },
    );
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 60;
      _isTimerActive = true;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageStrings.verify,
              height: 93.16,
              width: 93.16,
            ),
            SizedBox(
              height: 39.67,
            ),
            Text(
              AppLocalizations.of(context)!.verify,
              style: TextStyle(
                color: TColors.black,
                fontFamily: AppFonts.interbold,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              AppLocalizations.of(context)!.otpsent,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.interregular,
                fontSize: 14,
                color: TColors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+1 98980 98980',
                  style: TextStyle(
                    fontFamily: AppFonts.interbold,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.black,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: Image.asset(
                    ImageStrings.edit,
                    scale: 4,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 37,
            ),
            Form(
              key: _formKey,
              child: PinCodeTextFieldWidget(
                appContext: context,
                onCompleted: (value) {},
              ),
            ),
            SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: _isTimerActive
                  ? null
                  : () {
                      _resendCode();
                    },
              child: Text(
                _isTimerActive
                    ? "00:${_secondsRemaining.toString().padLeft(2, '0')}"
                    : "",
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  color: _isTimerActive ? TColors.grey : TColors.black,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 34,
            ),
            AppButton(
              title: AppLocalizations.of(context)!.verify,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompleteProfileScreen(),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 28,
            ),
            if (!_isTimerActive)
              GestureDetector(
                onTap: _isTimerActive
                    ? null
                    : () {
                        _resendCode();
                      },
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontFamily: AppFonts.interbold,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: TColors.blue,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
