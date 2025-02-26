import 'package:flutter/material.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.cardodd,
      appBar: MyAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(ImageStrings.homeapplogo, scale: 4),
        ),
        title: AppLocalizations.of(context)!.village,
        color: TColors.black,
        fontSize: 27,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: Image.asset(
              ImageStrings.search,
              height: 24,
              width: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
              },
              child: Image.asset(
                ImageStrings.notificationlogo,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
