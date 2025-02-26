import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/features/filter/filters_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/constants/image_strings.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
        leading: null,
        title: AppLocalizations.of(context)!.discover,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FiltersScreen(),
                  ),
                );
              },
              child: Image.asset(
                ImageStrings.filter,
                height: 24,
                width: 24,
              ),
            ),
          )
        ],
      ),

    );
  }
}
