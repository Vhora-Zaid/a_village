import 'dart:io';

import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_button.dart';
import 'package:a_village/common/widgets/image_picker_bottomsheet.dart';
import 'package:a_village/features/register/your_interests_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final _picker = ImagePicker();
  File? _pickedImage;

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
              const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.completeprofile,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.circular(30),
                    image: _pickedImage != null
                        ? DecorationImage(
                            image: FileImage(_pickedImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Stack(
                    children: [
                      if (_pickedImage == null)
                        Center(
                          child: Image.asset(
                            ImageStrings.defaultperson,
                            height: 62.1,
                            width: 55.58,
                          ),
                        ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () async {
                            showImagePickerOptions(
                              context: context,
                              onTapGallery: () async {
                                final XFile? image =
                                await _picker.pickImage(source: ImageSource.gallery);
                                if (image != null) {
                                  setState(() {
                                    _pickedImage = File(image.path);
                                  });
                                }
                              },
                              onTapCamera: () async {
                                final XFile? image =
                                await _picker.pickImage(source: ImageSource.camera);
                                if (image != null) {
                                  setState(() {
                                    _pickedImage = File(image.path);
                                  });
                                }
                              },
                            );
                          },
                          child: Image.asset(
                            ImageStrings.camera,
                            scale: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                AppLocalizations.of(context)!.aboutyou,
                style: TextStyle(
                    fontFamily: AppFonts.interregular,
                    fontSize: 15,
                    color: TColors.black,),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                cursorColor: TColors.placeholder,
                maxLines: 12,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.writehere,
                  hintStyle: TextStyle(
                    color: TColors.placeholder,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color(0xffDBDDE2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color(0xffDBDDE2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color(0xffDBDDE2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 20),
        child: AppButton(
          title: AppLocalizations.of(context)!.buttoncontinue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YourInterestsScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
