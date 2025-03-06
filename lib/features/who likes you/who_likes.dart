import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_searchbar.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_gridview.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class WhoLikesYou extends StatefulWidget {
  const WhoLikesYou({super.key});

  @override
  State<WhoLikesYou> createState() => _WhoLikesYouState();
}

class _WhoLikesYouState extends State<WhoLikesYou> {

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
            floating: false,
            pinned: true,
            centerTitle: false,
            title: Text(
              AppLocalizations.of(context)!.wholikesyou,
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
            floating: false,
            pinned: true,
            centerTitle: false,
            title: const Padding(
              padding: EdgeInsets.only(bottom: 15, top: 10),
              child: AppSearchBar(),
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
