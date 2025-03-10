import 'package:a_village/features/register/your_interests_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/interest_selection.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class QuestionsScreen2 extends StatefulWidget {
  const QuestionsScreen2({super.key});

  @override
  State<QuestionsScreen2> createState() => _QuestionsScreen2State();
}

class _QuestionsScreen2State extends State<QuestionsScreen2> {
  Map<int, List<String>> selectedOptions = {};

  void onOptionSelected(int index, List<String> newSelection) {
    setState(() {
      selectedOptions[index] = newSelection;
    });
  }

  List<dynamic> questionsList = [
    {
      "question": 'Does your child show stereotyped or repetitive motor movements?',
      "example": 'For example, lining up toys, flipping objects, repeated words, or "stimming."',
    },
    {
      "question": 'Does your child show the need for insistence on sameness?',
      "example": 'For example, extreme distress at small changes, difficulties with transitions, and rigid thinking patterns. Child may need to take the same route or eat the same food every day.',
    },
    {
      "question": 'Does your child show highly restricted or fixated interests that are abnormal in intensity or focus?',
      "example": 'For example, they have a strong attachment to or preoccupation with unusual objects or interests.',
    },
    {
      "question": 'Does your child show hyper or hypo reactivity to sensory input?',
      "example": 'For example, indifference to pain or temperature, adverse responses to specific sounds or textures.',
    },
    {
      "question": 'Have these symptoms been present since your childs early developmental period?',
      "example": '',
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
                'Restricted Repetitive Patterns of Behavior',
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 18,
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
                        questionsList[3]['question'],
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
                        questionsList[3]['example'],
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
                        selectedOptions: selectedOptions[3] ?? [],
                        onSelectionChanged: (selection) =>
                            onOptionSelected(3, selection),
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
                        questionsList[4]['question'],
                        style: TextStyle(
                          color: TColors.black,
                          fontFamily: AppFonts.interbold,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomChip(
                        selectedOptions: selectedOptions[4] ?? [],
                        onSelectionChanged: (selection) =>
                            onOptionSelected(4, selection),
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
          title: AppLocalizations.of(context)!.buttoncontinue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YourInterestsScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
