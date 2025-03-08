import 'package:a_village/common/widgets/app_listview.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_searchbar.dart';
import '../../utils/constants/image_strings.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
        leading: null,
        title: AppLocalizations.of(context)!.favorites,
        color: TColors.black,
        fontSize: 27,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                ImageStrings.notificationlogo,
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
          SliverFillRemaining(
            child: AppListViewFavorites(),
          ),
        ],
      ),
    );
  }
}
