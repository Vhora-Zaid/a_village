import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_searchbar.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_gridview.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class YourLikesScreen extends StatefulWidget {
  const YourLikesScreen({super.key});

  @override
  State<YourLikesScreen> createState() => _YourLikesScreenState();
}

class _YourLikesScreenState extends State<YourLikesScreen> {
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
        // title: AppLocalizations.of(context)!.yourlikes,
        // color: TColors.black,
        // fontSize: 27,
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
              AppLocalizations.of(context)!.yourlikes,
              style: TextStyle(
                  color: TColors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.interbold),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return LikesView();
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
