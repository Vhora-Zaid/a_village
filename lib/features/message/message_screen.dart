import 'package:a_village/common/widgets/app_listview.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_searchbar.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
        leading: null,
        title: AppLocalizations.of(context)!.message,
        color: TColors.black,
        fontSize: 27,
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
            title: const Padding(
              padding: EdgeInsets.only(bottom: 15, top: 10),
              child: AppSearchBar(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 15),
              child: Text(
                AppLocalizations.of(context)!.onlineusers,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: AppListView(),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 1,
              thickness: 1,
              color: TColors.divider,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => AppListViewVertical(
                onTap: (index) {
                  Navigator.pushNamed(
                    context,
                    '/chat',
                    arguments: index,
                  );
                },
                height: 56,
                width: 56,
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
                messages: [
                  'Hey! Hows it going?',
                  'What kind of music do you like?',
                  'Sounds good to me!',
                  'What is your favorite color?',
                  'Sounds good to me!',
                  'What is your favorite color?',
                  'I like red',
                  'What is your favorite color?'
                ],
                timestamps: [
                  'A week ago',
                  '07 Apr 2023',
                  '24 Apr 2023',
                  '01 Oct 2023',
                  '08 Apr 2023',
                  '18 Aug 2023',
                  '09 Dec 2023',
                  '08 Apr 2023'
                ],
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
