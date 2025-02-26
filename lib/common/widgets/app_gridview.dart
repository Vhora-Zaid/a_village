import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class SelectableGrid extends StatefulWidget {
  const SelectableGrid({super.key});

  @override
  _SelectableGridState createState() => _SelectableGridState();
}

class _SelectableGridState extends State<SelectableGrid> {
  List<bool> selectedItems = List.filled(6, false);

  get categoryNames => [
        AppLocalizations.of(context)!.love,
        AppLocalizations.of(context)!.friends,
        AppLocalizations.of(context)!.business,
        AppLocalizations.of(context)!.fling,
        AppLocalizations.of(context)!.male,
        AppLocalizations.of(context)!.female
      ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItems[index] = !selectedItems[index];
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: 144,
                  width: 164,
                  decoration: BoxDecoration(
                    border: selectedItems[index]
                        ? null
                        : Border.all(
                            color: TColors.bordercolor,
                            width: 1,
                          ),
                    color:
                        selectedItems[index] ? TColors.yellow : TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 67,
                          width: 67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: selectedItems[index]
                                ? TColors.white
                                : Color(0xffFFFAE8),
                          ),
                          child: Image.asset(
                            [
                              ImageStrings.love,
                              ImageStrings.friends,
                              ImageStrings.business,
                              ImageStrings.fling,
                              ImageStrings.male,
                              ImageStrings.female,
                            ][index],
                            scale: 4,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          categoryNames[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppFonts.interregular,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: TColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: selectedItems[index]
                      ? Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: TColors.yellow,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset(
                              ImageStrings.tick,
                              scale: 4,
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SelectableImageGrid extends StatefulWidget {
  final int crossAxisCount;
  final double height;
  final double width;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final Color textColor;

  const SelectableImageGrid({
    Key? key,
    this.crossAxisCount = 2,
    this.height = 192,
    this.width = 164,
    this.selectedColor = Colors.transparent,
    this.unselectedColor = TColors.white,
    this.borderColor = TColors.imageborder,
    this.textColor = TColors.black,
  }) : super(key: key);

  @override
  _SelectableImageGridState createState() => _SelectableImageGridState();
}

class _SelectableImageGridState extends State<SelectableImageGrid> {
  List<File?> selectedImages = List.filled(6, null);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.width / widget.height,
      ),
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _selectImage(index),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    border: selectedImages[index] == null
                        ? Border.all(
                            color: widget.borderColor,
                            width: 1,
                          )
                        : null,
                    color: selectedImages[index] != null
                        ? widget.selectedColor
                        : widget.unselectedColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: selectedImages[index] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            selectedImages[index]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : Center(
                          child: Image.asset(
                            ImageStrings.plus,
                            height: 24,
                            width: 24,
                          ),
                        ),
                ),
                if (selectedImages[index] != null)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Image.asset(
                          ImageStrings.delete,
                          height: 36,
                          width: 36,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectImage(int index) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImages[index] = File(pickedFile.path);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages[index] = null;
    });
  }
}
