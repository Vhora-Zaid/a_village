import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_searchbar.dart';
import 'package:a_village/features/filter/filters_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_gridview.dart';
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
        color: TColors.black,
        fontSize: 27,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
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
          ),
        ],
      ),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProfileGridView();
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
