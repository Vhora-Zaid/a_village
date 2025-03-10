import 'package:a_village/features/register/questions_screen_2.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/interest_selection.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class QuestionsScreen1 extends StatefulWidget {
  const QuestionsScreen1({super.key});

  @override
  State<QuestionsScreen1> createState() => _QuestionsScreen1State();
}

class _QuestionsScreen1State extends State<QuestionsScreen1> {

  Map<int, List<String>> selectedOptions = {};

  void onOptionSelected(int index, List<String> newSelection) {
    setState(() {
      selectedOptions[index] = newSelection;
    });
  }

  List<dynamic> questionsList = [
    {
      "question": 'Does your child show deficits in social-emotional reciprocity?',
      "example": ' For example, child fails to engage in normal back and forth conversations, shows reduced interest in sharing emotions, or fails to initiate social interactions.',
    },
    {
      "question": 'Does your child show deficits in non-verbal communication behaviors?',
      "example": 'For example, your child is unable to communicate verbally using body language, maintain eye contact, or use facial expressions.',
    },
    {
      "question": 'Does your child show deficits in developing, maintaining, and understanding relationships?',
      "example": 'For example, your child has difficulties adjusting to behaviors, different social contexts, difficulties sharing imaginative play or making friends, and shows complete absence of interest in peers.',
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
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deficits in Social Communication and Interaction',
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Card(
                color: TColors.cardeven,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        questionsList[0]['question'],
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interbold,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        questionsList[0]['example'],
                        style: TextStyle(
                          color: TColors.placeholder,
                          fontSize: 12,
                          fontFamily: AppFonts.interregular,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomChip(
                        selectedOptions: selectedOptions[0] ?? [],
                        onSelectionChanged: (selection) =>
                            onOptionSelected(0, selection),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: TColors.cardodd,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        questionsList[1]['question'],
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interbold,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        questionsList[1]['example'],
                        style: TextStyle(
                          color: TColors.placeholder,
                          fontSize: 12,
                          fontFamily: AppFonts.interregular,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomChip(
                        selectedOptions: selectedOptions[1] ?? [],
                        onSelectionChanged: (selection) =>
                            onOptionSelected(1, selection),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: TColors.cardeven,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        questionsList[2]['question'],
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interbold,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        questionsList[2]['example'],
                        style: TextStyle(
                          color: TColors.placeholder,
                          fontSize: 12,
                          fontFamily: AppFonts.interregular,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomChip(
                        selectedOptions: selectedOptions[2] ?? [],
                        onSelectionChanged: (selection) =>
                            onOptionSelected(2, selection),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
        const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 20),
        child: AppButton(
          title: AppLocalizations.of(context)!.next,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionsScreen2(),
              ),
            );
          },
        ),
      ),
    );
  }
}
