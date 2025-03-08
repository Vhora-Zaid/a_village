import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  final List<Map<String, String>> privacyPolicySections = [
    {
      "title": "1. Introduction",
      "content": "Welcome to our Privacy Policy. Your privacy is critically important to us. This section explains our approach to handling your personal information."
    },
    {
      "title": "2. Data Collection",
      "content": "We collect user data to improve the app experience and provide better services. This may include information such as your name, email, and usage data."
    },
    {
      "title": "3. Data Usage",
      "content": "Your data is used only for app functionality and is not shared with third parties without your consent. We may use it to enhance user experience and for analytical purposes."
    },
    {
      "title": "4. Cookie Policy",
      "content": "We use cookies to enhance your browsing experience. These cookies help us understand how you use our app and improve our services accordingly."
    },
    {
      "title": "5. Children’s Privacy",
      "content": "Our app is not intended for children under the age of 18. We do not knowingly collect personal information from children without parental consent."
    },
    {
      "title": "6. Security",
      "content": "We take strong measures to ensure your data remains safe and protected. Encryption and secure servers are used to safeguard your information."
    },
    {
      "title": "7. Changes to Privacy Policy",
      "content": "We may update this Privacy Policy from time to time. Any changes will be communicated via app updates or notifications."
    },
    {
      "title": "8. Complaints",
      "content": "If you have any complaints regarding how we handle your data, you may contact our support team. We take privacy concerns seriously and will respond promptly."
    },
    {
      "title": "9. Contact Us",
      "content": "If you have any questions about this Privacy Policy, feel free to reach out to us via email or through our customer support section in the app."
    },
  ];

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
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.privacy,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: privacyPolicySections.map((section) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section["title"]!,
                        style: TextStyle(
                          fontFamily: AppFonts.interbold,
                          color: TColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        section["content"]!,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Divider(color: TColors.stroke),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
