import 'dart:io';
import 'package:a_village/common/widgets/image_picker_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class ProfileGrid extends StatefulWidget {
  const ProfileGrid({super.key});

  @override
  State<ProfileGrid> createState() => _ProfileGridState();
}

class _ProfileGridState extends State<ProfileGrid> {
  List<File?> selectedImages = List.filled(6, null);

  Future<void> _selectImage(int index) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                'Take a Photo',
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 16,
                ),
              ),
              onPressed: () async {
                Navigator.pop(context);

                PermissionStatus permissionStatus =
                    await Permission.camera.status;

                if (permissionStatus.isGranted) {
                  // Permission already granted, proceed with picking image
                  final pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      selectedImages[index] = File(pickedFile.path);
                    });
                  }
                } else if (permissionStatus.isDenied) {
                  // Request permission again
                  PermissionStatus newStatus =
                      await Permission.camera.request();
                  if (newStatus.isGranted) {
                    // Permission granted after request, pick image
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        selectedImages[index] = File(pickedFile.path);
                      });
                    }
                  } else {
                    // If permission is denied again, show settings alert
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("Permission Required"),
                          content: Text(
                            "This app needs access to the camera. Would you like to go to the app settings to enable it?",
                            style: TextStyle(fontSize: 14),
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                openAppSettings();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else if (permissionStatus.isPermanentlyDenied) {
                  // Permission permanently denied, show settings dialog
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text("Permission Required"),
                        content: Text(
                          "This app needs access to the camera. Please enable permissions in settings.",
                          style: TextStyle(fontSize: 14),
                        ),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: TColors.black,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                color: TColors.black,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {
                              openAppSettings();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                'Choose from Gallery',
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 16,
                ),
              ),
              onPressed: () async {
                Navigator.pop(context);

                PermissionStatus permissionStatus =
                    await Permission.photos.status;

                if (permissionStatus.isGranted) {
                  // Permission already granted, proceed with picking image
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      selectedImages[index] = File(pickedFile.path);
                    });
                  }
                } else if (permissionStatus.isDenied) {
                  // Request permission again
                  PermissionStatus newStatus =
                      await Permission.photos.request();
                  if (newStatus.isGranted) {
                    // Permission granted after request, pick image
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        selectedImages[index] = File(pickedFile.path);
                      });
                    }
                  } else {
                    // If permission is denied again, show alert
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            "Permission is required",
                            style: TextStyle(
                              fontSize: 20,
                              color: TColors.black,
                            ),
                          ),
                          content: Text(
                            "This app needs access to photos and videos. Would you like to go to the app settings to turn it on?",
                            style: TextStyle(fontSize: 14),
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                openAppSettings();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else if (permissionStatus.isPermanentlyDenied) {
                  // Permission permanently denied, show settings dialog
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text(
                          "Permission Required",
                          style: TextStyle(
                            fontSize: 20,
                            color: TColors.black,
                          ),
                        ),
                        content: Text(
                          "This app needs access to your photos. Please enable permissions in settings.",
                          style: TextStyle(fontSize: 14),
                        ),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: TColors.black,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                color: TColors.black,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {
                              openAppSettings();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages[index] = null;
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
                      onTap: () => _selectImage(0),
                      child: Container(
                        height: 192,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          border: selectedImages[0] != null
                              ? null
                              : Border.all(color: TColors.imageborder),
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: selectedImages[0] != null
                              ? DecorationImage(
                                  image:
                                      FileImage(File(selectedImages[0]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedImages[0] == null
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
                    if (selectedImages[0] != null)
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
                          onTap: () => _selectImage(1),
                          child: Container(
                            height: 91,
                            width: imageWidth,
                            decoration: BoxDecoration(
                              border: selectedImages[1] != null
                                  ? null
                                  : Border.all(color: TColors.imageborder),
                              color: TColors.stroke,
                              borderRadius: BorderRadius.circular(10),
                              image: selectedImages[1] != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          File(selectedImages[1]!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: selectedImages[1] == null
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
                        if (selectedImages[1] != null)
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
                          onTap: () => _selectImage(2),
                          child: Container(
                            height: 91,
                            width: imageWidth,
                            decoration: BoxDecoration(
                              border: selectedImages[2] != null
                                  ? null
                                  : Border.all(color: TColors.imageborder),
                              color: TColors.stroke,
                              borderRadius: BorderRadius.circular(10),
                              image: selectedImages[2] != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          File(selectedImages[2]!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: selectedImages[2] == null
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
                        if (selectedImages[2] != null)
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
                      onTap: () => _selectImage(3),
                      child: Container(
                        height: 91,
                        width: imageWidth,
                        decoration: BoxDecoration(
                          border: selectedImages[3] != null
                              ? null
                              : Border.all(color: TColors.imageborder),
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: selectedImages[3] != null
                              ? DecorationImage(
                                  image:
                                      FileImage(File(selectedImages[3]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedImages[3] == null
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
                    if (selectedImages[3] != null)
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
                      onTap: () => _selectImage(4),
                      child: Container(
                        height: 91,
                        width: imageWidth,
                        decoration: BoxDecoration(
                          border: selectedImages[4] != null
                              ? null
                              : Border.all(color: TColors.imageborder),
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: selectedImages[4] != null
                              ? DecorationImage(
                                  image:
                                      FileImage(File(selectedImages[4]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedImages[4] == null
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
                    if (selectedImages[4] != null)
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
                      onTap: () => _selectImage(5),
                      child: Container(
                        height: 91,
                        width: imageWidth,
                        decoration: BoxDecoration(
                          border: selectedImages[5] != null
                              ? null
                              : Border.all(color: TColors.imageborder),
                          color: TColors.stroke,
                          borderRadius: BorderRadius.circular(10),
                          image: selectedImages[5] != null
                              ? DecorationImage(
                                  image:
                                      FileImage(File(selectedImages[5]!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedImages[5] == null
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
                    if (selectedImages[5] != null)
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
