import 'package:flutter/material.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      textAlignVertical: TextAlignVertical.center,
      cursorColor: TColors.grey,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 11, 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: TColors.searchborder,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: TColors.searchborder,
            width: 1.0,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Image.asset(
            ImageStrings.search,
            scale: 3.5,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        hintText: AppLocalizations.of(context)!.search,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: TColors.placeholder,
          fontFamily: AppFonts.interregular,
        ),
      ),
    );
  }
}
