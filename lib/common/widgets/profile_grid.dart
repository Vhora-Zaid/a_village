import 'dart:io';
import 'package:a_village/common/widgets/image_picker_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class ProfileGrid extends StatefulWidget {
  const ProfileGrid({super.key});

  @override
  State<ProfileGrid> createState() => _ProfileGridState();
}

class _ProfileGridState extends State<ProfileGrid> {
  final ImagePicker _picker = ImagePicker();
  List<XFile?> _images = List<XFile?>.filled(6, null);

  Future<void> _pickImage(int index) async {
    if (_images[index] == null) {
      showImagePickerOptions(
        context: context,
        onTapGallery: () async {
          final XFile? image =
              await _picker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            setState(() {
              _images[index] = image;
            });
          }
        },
        onTapCamera: () async {
          final XFile? image =
              await _picker.pickImage(source: ImageSource.camera);
          if (image != null) {
            setState(() {
              _images[index] = image;
            });
          }
        },
      );
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images[index] = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.654;
        double imageWidth = (containerWidth - 12) / 2;
        return Column(
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(0),
                      child: Container(
                        height: 192,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: _images[0] != null
                              ? DecorationImage(
                                  image: FileImage(File(_images[0]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _images[0] == null
                            ? Center(
                                child: Image.asset(
                                  ImageStrings.plus,
                                  height: 24,
                                  width: 24,
                                ),
                              )
                            : null,
                      ),
                    ),
                    if (_images[0] != null)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: GestureDetector(
                          onTap: () => _removeImage(0),
                          child: Image.asset(
                            ImageStrings.closeprofile,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 12),
                Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: () => _pickImage(1),
                          child: Container(
                            height: 91,
                            width: imageWidth,
                            decoration: BoxDecoration(
                              color: TColors.stroke,
                              borderRadius: BorderRadius.circular(10),
                              image: _images[1] != null
                                  ? DecorationImage(
                                      image: FileImage(File(_images[1]!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: _images[1] == null
                                ? Center(
                              child: Image.asset(
                                ImageStrings.plus,
                                height: 24,
                                width: 24,
                              ),
                            )
                                : null,
                          ),
                        ),
                        if (_images[1] != null)
                          Positioned(
                            top: -5,
                            right: -5,
                            child: GestureDetector(
                              onTap: () => _removeImage(1),
                              child: Image.asset(
                                ImageStrings.closeprofile,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 13),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: () => _pickImage(2),
                          child: Container(
                            height: 91,
                            width: imageWidth,
                            decoration: BoxDecoration(
                              color: TColors.stroke,
                              borderRadius: BorderRadius.circular(10),
                              image: _images[2] != null
                                  ? DecorationImage(
                                      image: FileImage(File(_images[2]!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: _images[2] == null
                                ? Center(
                              child: Image.asset(
                                ImageStrings.plus,
                                height: 24,
                                width: 24,
                              ),
                            )
                                : null,
                          ),
                        ),
                        if (_images[2] != null)
                          Positioned(
                            top: -5,
                            right: -5,
                            child: GestureDetector(
                              onTap: () => _removeImage(2),
                              child: Image.asset(
                                ImageStrings.closeprofile,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(3),
                      child: Container(
                        height: 91,
                        width: imageWidth,
                        decoration: BoxDecoration(
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: _images[3] != null
                              ? DecorationImage(
                                  image: FileImage(File(_images[3]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _images[3] == null
                            ? Center(
                          child: Image.asset(
                            ImageStrings.plus,
                            height: 24,
                            width: 24,
                          ),
                        )
                            : null,
                      ),
                    ),
                    if (_images[3] != null)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: GestureDetector(
                          onTap: () => _removeImage(3),
                          child: Image.asset(
                            ImageStrings.closeprofile,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(4),
                      child: Container(
                        height: 91,
                        width: imageWidth,
                        decoration: BoxDecoration(
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: _images[4] != null
                              ? DecorationImage(
                                  image: FileImage(File(_images[4]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _images[4] == null
                            ? Center(
                          child: Image.asset(
                            ImageStrings.plus,
                            height: 24,
                            width: 24,
                          ),
                        )
                            : null,
                      ),
                    ),
                    if (_images[4] != null)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: GestureDetector(
                          onTap: () => _removeImage(4),
                          child: Image.asset(
                            ImageStrings.closeprofile,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(5),
                      child: Container(
                        height: 91,
                        width: imageWidth,
                        decoration: BoxDecoration(
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: _images[5] != null
                              ? DecorationImage(
                                  image: FileImage(File(_images[5]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _images[5] == null
                            ? Center(
                          child: Image.asset(
                            ImageStrings.plus,
                            height: 24,
                            width: 24,
                          ),
                        )
                            : null,
                      ),
                    ),
                    if (_images[5] != null)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: GestureDetector(
                          onTap: () => _removeImage(5),
                          child: Image.asset(
                            ImageStrings.closeprofile,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
