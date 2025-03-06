import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/colors.dart';

showImagePickerOptions(
    {required BuildContext context,
    required Function()? onTapGallery,
    required Function()? onTapCamera}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(
                Icons.photo_library,
                color: Theme.of(context).textTheme.titleMedium!.color,
              ),
              title: Text(
                // localization.
                AppLocalizations.of(context)!.imagefromlibrary,
                style: TextStyle(
                  fontFamily: AppFonts.interbold,
                  color: TColors.black,
                  fontWeight: FontWeight.w600
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                onTapGallery!();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: Theme.of(context).textTheme.titleMedium!.color,
              ),
              title: Text(
                AppLocalizations.of(context)!.imagefromcamera,
                style: TextStyle(
                    fontFamily: AppFonts.interbold,
                    color: TColors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                onTapCamera!();
              },
            )
          ],
        ),
      );
    },
  );
}
