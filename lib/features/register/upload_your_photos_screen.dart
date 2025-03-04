import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_bottomnavigation.dart';
import 'package:a_village/common/widgets/app_gridview.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/app_button.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class UploadYourPhotosScreen extends StatefulWidget {
  const UploadYourPhotosScreen({super.key});

  @override
  State<UploadYourPhotosScreen> createState() => _UploadYourPhotosScreenState();
}

class _UploadYourPhotosScreenState extends State<UploadYourPhotosScreen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.uploadphotos,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                AppLocalizations.of(context)!.bestphotos,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  color: Color(0xff6F778B),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SelectableImageGrid(
                crossAxisCount: 2,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 10),
        child: AppButton(
          title: AppLocalizations.of(context)!.save,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AppBottomNavBar()));
          },
        ),
      ),
    );
  }
}
