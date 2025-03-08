import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class InterestSelection extends StatefulWidget {
  const InterestSelection({super.key});

  @override
  _InterestSelectionState createState() => _InterestSelectionState();
}

class _InterestSelectionState extends State<InterestSelection> {
  List<String> selectedInterests = [''];

  @override
  Widget build(BuildContext context) {
    final interests = [
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.dancing,
      AppLocalizations.of(context)!.language,
      AppLocalizations.of(context)!.movie,
      AppLocalizations.of(context)!.book,
      AppLocalizations.of(context)!.architecture,
      AppLocalizations.of(context)!.photography,
      AppLocalizations.of(context)!.fashion,
      AppLocalizations.of(context)!.writing,
      AppLocalizations.of(context)!.nature,
      AppLocalizations.of(context)!.painting,
      AppLocalizations.of(context)!.football,
      AppLocalizations.of(context)!.animals,
      AppLocalizations.of(context)!.peoplesociety,
      AppLocalizations.of(context)!.gym,
      AppLocalizations.of(context)!.food,
      AppLocalizations.of(context)!.travel,
      AppLocalizations.of(context)!.art
    ];
    Widget getAvatarForInterest(String interest) {
      switch (interest) {
        case 'Gaming':
          return Image.asset(ImageStrings.gaming);
        case 'Dancing':
          return Image.asset(ImageStrings.dancing);
        case 'Language':
          return Image.asset(ImageStrings.language);
        case 'Movie':
          return Image.asset(ImageStrings.movie);
        case 'Book & Novel':
          return Image.asset(ImageStrings.book);
        case 'Architecture':
          return Image.asset(ImageStrings.architecture);
        case 'Photography':
          return Image.asset(ImageStrings.photography);
        case 'Fashion':
          return Image.asset(ImageStrings.fashion);
        case 'Writing':
          return Image.asset(ImageStrings.writing);
        case 'Nature':
          return Image.asset(ImageStrings.nature);
        case 'Painting':
          return Image.asset(ImageStrings.painting);
        case 'Football':
          return Image.asset(ImageStrings.football);
        case 'Animals':
          return Image.asset(ImageStrings.animals);
        case 'People & Society':
          return Image.asset(ImageStrings.peopleicon);
        case 'Gym & Fitness':
          return Image.asset(ImageStrings.gym);
        case 'Food & Drink':
          return Image.asset(ImageStrings.food);
        case 'Travel & Places':
          return Image.asset(ImageStrings.travel);
        case 'Art':
          return Image.asset(ImageStrings.art);
        default:
          return Container();
      }
    }

    return Column(
      children: [
        Wrap(
          spacing: 13,
          runSpacing: 4,
          children: interests.map((interest) {
            bool isSelected = selectedInterests.contains(interest);
            return ChoiceChip(
              showCheckmark: false,
              avatar: getAvatarForInterest(interest),
              label: Text(interest),
              backgroundColor: TColors.white,
              selectedColor: TColors.yellow,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Color(0xffE3E3E3),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: TColors.black,
                fontFamily: AppFonts.interregular,
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedInterests.add(interest);
                  } else {
                    selectedInterests.remove(interest);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class PreferenceSelection extends StatefulWidget {
  const PreferenceSelection({super.key});

  @override
  _PreferenceSelectionState createState() => _PreferenceSelectionState();
}

class _PreferenceSelectionState extends State<PreferenceSelection> {
  List<String> selectedPreference = [''];

  @override
  Widget build(BuildContext context) {
    final preferences = [
      AppLocalizations.of(context)!.men,
      AppLocalizations.of(context)!.women,
      AppLocalizations.of(context)!.both,
    ];

    return Column(
      children: [
        Wrap(
          spacing: 10,
          children: preferences.map((preference) {
            bool isSelected = selectedPreference.contains(preference);
            return ChoiceChip(
              showCheckmark: false,
              label: Text(preference),
              backgroundColor: TColors.white,
              selectedColor: TColors.yellow,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Color(0xffE3E3E3),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: TColors.black,
                fontFamily: AppFonts.interregular,
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedPreference.add(preference);
                  } else {
                    selectedPreference.remove(preference);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class InterestsSelection extends StatefulWidget {
  const InterestsSelection({super.key});

  @override
  _InterestsSelectionState createState() => _InterestsSelectionState();
}

class _InterestsSelectionState extends State<InterestsSelection> {
  List<String> selectedPreference = ['Women'];

  @override
  Widget build(BuildContext context) {
    final preferences = [
      AppLocalizations.of(context)!.men,
      AppLocalizations.of(context)!.women,
      AppLocalizations.of(context)!.everyone,
    ];

    return Column(
      children: [
        Wrap(
          spacing: 16,
          children: preferences.map((preference) {
            bool isSelected = selectedPreference.contains(preference);
            return ChoiceChip(
              showCheckmark: false,
              label: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.027,
                  vertical: 3,
                ),
                child: Text(preference),
              ),
              backgroundColor: TColors.white,
              selectedColor: TColors.yellow,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Color(0xffE3E3E3),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: TColors.black,
                fontFamily: AppFonts.interregular,
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(
                  () {
                    selectedPreference.clear();
                    if (selected) {
                      selectedPreference.add(preference);
                    }
                  },
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  List<String> selectedPreference = ['Male'];

  @override
  Widget build(BuildContext context) {
    final preferences = [
      AppLocalizations.of(context)!.male,
      AppLocalizations.of(context)!.female,
    ];

    return Row(
      children: [
        Wrap(
          spacing: 15,
          children: preferences.map((preference) {
            bool isSelected = selectedPreference.contains(preference);
            return ChoiceChip(
              showCheckmark: false,
              label: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.115,
                  vertical: 3,
                ),
                child: Text(preference),
              ),
              backgroundColor: TColors.white,
              selectedColor: TColors.yellow,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Color(0xffE3E3E3),
                ),
                borderRadius: isSelected
                    ? BorderRadius.circular(50)
                    : BorderRadius.circular(20),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: TColors.black,
                fontFamily: AppFonts.interregular,
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(
                      () {
                    selectedPreference.clear();
                    if (selected) {
                      selectedPreference.add(preference);
                    }
                  },
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class InterestFilterSelection extends StatefulWidget {
  const InterestFilterSelection({super.key});

  @override
  _InterestFilterSelectionState createState() =>
      _InterestFilterSelectionState();
}

class _InterestFilterSelectionState extends State<InterestFilterSelection> {
  List<String> selectedInterests = [''];

  @override
  Widget build(BuildContext context) {
    final interests = [
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.dancing,
      AppLocalizations.of(context)!.language,
      AppLocalizations.of(context)!.movie,
      AppLocalizations.of(context)!.book,
      AppLocalizations.of(context)!.architecture,
      AppLocalizations.of(context)!.photography,
      AppLocalizations.of(context)!.fashion,
      AppLocalizations.of(context)!.writing,
    ];

    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: -4,
          children: interests.map((interest) {
            bool isSelected = selectedInterests.contains(interest);
            return ChoiceChip(
              showCheckmark: false,
              label: Text(interest),
              backgroundColor: TColors.white,
              selectedColor: TColors.yellow,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Color(0xffE3E3E3),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: TColors.black,
                fontFamily: AppFonts.interregular,
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedInterests.add(interest);
                  } else {
                    selectedInterests.remove(interest);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class UserInterestSelection extends StatefulWidget {
  const UserInterestSelection({super.key});

  @override
  _UserInterestSelectionState createState() => _UserInterestSelectionState();
}

class _UserInterestSelectionState extends State<UserInterestSelection> {
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    final interests = [
      AppLocalizations.of(context)!.photography,
      AppLocalizations.of(context)!.fashion,
      AppLocalizations.of(context)!.writing,
      AppLocalizations.of(context)!.nature,
    ];
    Widget getAvatarForInterest(String interest) {
      switch (interest) {
        case 'Photography':
          return Image.asset(ImageStrings.photography);
        case 'Fashion':
          return Image.asset(ImageStrings.fashion);
        case 'Writing':
          return Image.asset(ImageStrings.writing);
        case 'Nature':
          return Image.asset(ImageStrings.nature);
        default:
          return Container();
      }
    }

    return Column(
      children: [
        Wrap(
          spacing: 13,
          runSpacing: 4,
          children: interests.map((interest) {
            bool isSelected = selectedInterests.contains(interest);
            return Chip(
              avatar: getAvatarForInterest(interest),
              label: Text(interest),
              backgroundColor: TColors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Color(0xffE3E3E3),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: TColors.black,
                fontFamily: AppFonts.interregular,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
