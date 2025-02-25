import 'package:a_village/common/widgets/app_appbar.dart';
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
        onTap: () {
          Navigator.pop(context);
        },
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
              AppGridViewForPhotos(
                items: List.generate(6, (index) => ImageStrings.defaultperson),
                selectedItems: List.generate(6, (index) => false),
                onTap: (index) {},
                addImage: ImageStrings.male,
              ),


              AppButton(
                title: 'Continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadYourPhotosScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
