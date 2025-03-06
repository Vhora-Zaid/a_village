import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              Card(
                color: TColors.cardeven,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: TColors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          ImageStrings.email,
                          scale: 5,
                          color: TColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Write us at',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: TColors.black,
                              fontSize: 15,
                              fontFamily: AppFonts.interbold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
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
                      fontSize: 15,
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
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: TColors.blue,
                            iconColor: Colors.grey,
                            title: Text(
                              faq["question"]!,
                              style: const TextStyle(
                                fontFamily: AppFonts.interbold,
                                color: TColors.black,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 15),
                                child: Text(
                                  faq["answer"]!,
                                  style: const TextStyle(
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
