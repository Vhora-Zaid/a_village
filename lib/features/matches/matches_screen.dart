import 'package:a_village/common/widgets/app_listview.dart';
import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_searchbar.dart';
import '../../utils/constants/image_strings.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            floating: true,
            pinned: true,
            centerTitle: false,
            title: Text(
              AppLocalizations.of(context)!.matches,
              style: TextStyle(
                  color: TColors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                fontFamily: AppFonts.interbold
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            floating: true,
            pinned: true,
            centerTitle: false,
            title: const Padding(
              padding: EdgeInsets.only(bottom: 15, top: 10),
              child: AppSearchBar(),
            ),
          ),
          SliverFillRemaining(
            child: MatchesView(),
          ),
        ],
      ),
    );
  }
}
