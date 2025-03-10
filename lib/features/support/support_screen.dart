import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final List<Map<String, String>> faqs = [
    {
      "question": "What is this app about?",
      "answer":
          "This app provides useful features to manage your tasks efficiently."
    },
    {
      "question": "How do I reset my password?",
      "answer":
          "You can reset your password from the settings page under 'Change Password'."
    },
    {
      "question": "Is this app free to use?",
      "answer": "Yes, this app is free with optional premium features."
    },
  ];
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.support,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'avillage@support.com',
                    query: encodeQueryParameters(
                        <String, String>{'subject': 'Support Request'}),
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not open email client')),
                    );
                  }
                },
                child: Card(
                  shadowColor: TColors.black,
                  color: TColors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: TColors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            ImageStrings.email,
                            scale: 5,
                            color: TColors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.writeus,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: TColors.black,
                                fontSize: 15,
                                fontFamily: AppFonts.interbold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'avillage@support.com',
                              style: TextStyle(
                                fontFamily: AppFonts.interbold,
                                color: TColors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 1,
                color: TColors.stroke,
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.faq,
                    style: TextStyle(
                      fontFamily: AppFonts.interregular,
                      fontSize: 16,
                      color: TColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: TColors.white,
                    elevation: 1,
                    child: Column(
                      children: faqs.map((faq) {
                        return Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: TColors.blue,
                            iconColor: Colors.grey,
                            title: Text(
                              faq["question"]!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.interbold,
                                color: TColors.black,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 5, bottom: 15),
                                child: Text(
                                  faq["answer"]!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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
