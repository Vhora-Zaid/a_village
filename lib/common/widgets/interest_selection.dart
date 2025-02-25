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
  List<String> selectedInterests = ['Book & Novel', 'Movie'];

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
