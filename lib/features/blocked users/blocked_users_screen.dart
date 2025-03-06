import 'package:a_village/common/widgets/app_listview.dart';
import 'package:a_village/features/user%20profile/user_profile_screen.dart';
import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/image_strings.dart';

class BlockedUsersScreen extends StatefulWidget {
  const BlockedUsersScreen({super.key});

  @override
  State<BlockedUsersScreen> createState() => _BlockedUsersScreenState();
}

class _BlockedUsersScreenState extends State<BlockedUsersScreen> {
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
              AppLocalizations.of(context)!.blockedusers,
              style: TextStyle(
                color: TColors.black,
                fontFamily: AppFonts.interbold,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AppListViewBlocked(
              profileImages: [
                ImageStrings.profile1,
                ImageStrings.profile2,
                ImageStrings.profile3,
                ImageStrings.profile4,
                ImageStrings.profile5,
                ImageStrings.profile6,
                ImageStrings.profile7,
                ImageStrings.profile8
              ],
              names: [
                'Stella Walsh',
                'Lottie Glover',
                'Mildred Butler',
                'Cameron Pena',
                'Victoria Norris',
                'Maggie Price',
                'Esther Kim',
                'Augusta Matthews'
              ],
              onTap: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
