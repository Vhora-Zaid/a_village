import 'dart:io';
import 'package:a_village/features/user%20profile/user_profile_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
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
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 3),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItems[index] = !selectedItems[index];
            });
          },
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
                  gradient: selectedItems[index]
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffFFEEA6),
                            Color(0xffFFD216),
                          ],
                        )
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
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
              Positioned(
                right: MediaQuery.sizeOf(context).width * 0.045,
                top: MediaQuery.sizeOf(context).height * 0.012,
                child: selectedItems[index]
                    ? Container(
                        height: MediaQuery.sizeOf(context).width * 0.06,
                        width: MediaQuery.sizeOf(context).width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          ImageStrings.tick,
                          scale: MediaQuery.sizeOf(context).width / 400,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
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
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.width / widget.height,
      ),
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _selectImage(index),
          child: Stack(
            children: [
              SizedBox(
                height: widget.height,
                width: widget.width,
                child: selectedImages[index] != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: widget.selectedColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            selectedImages[index]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      )
                    : DottedBorder(
                        borderType:
                            BorderType.RRect, // Rounded rectangle border
                        radius: const Radius.circular(8),
                        color: widget.borderColor,
                        strokeWidth: 1,
                        dashPattern: [6, 5],
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: widget.unselectedColor,
                          ),
                          child: Center(
                            child: Image.asset(
                              ImageStrings.plus,
                              height: 24,
                              width: 24,
                            ),
                          ),
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
        );
      },
    );
  }

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
}

class ProfileGridView extends StatelessWidget {
  const ProfileGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profiles = [
      {
        'imageUrl': ImageStrings.profile1,
        'name': 'Eleanor Pena',
        'age': 20,
        'status': 'Online',
        'isOnline': true,
        'location': 'Toledo'
      },
      {
        'imageUrl': ImageStrings.profile2,
        'name': 'Jenny Wilson',
        'age': 24,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Austin'
      },
      {
        'imageUrl': ImageStrings.profile3,
        'name': 'Jacob Jones',
        'age': 28,
        'status': 'Online',
        'isOnline': true,
        'location': 'Toledo'
      },
      {
        'imageUrl': ImageStrings.profile4,
        'name': 'Cameron Pena',
        'age': 30,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Fairfield'
      },
      {
        'imageUrl': ImageStrings.profile5,
        'name': 'Savannah Nguy',
        'age': 21,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Naperville'
      },
      {
        'imageUrl': ImageStrings.profile6,
        'name': 'Annette Black',
        'age': 31,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Orange'
      },
      {
        'imageUrl': ImageStrings.profile7,
        'name': 'Cody Fisher',
        'age': 32,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Pembroke Pines'
      },
      {
        'imageUrl': ImageStrings.profile8,
        'name': 'Emily Davis',
        'age': 25,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Fairfield'
      }
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        final profile = profiles[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: (index ~/ 2).isEven ? TColors.cardeven : TColors.cardodd,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 112,
                    width: 112,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(profile['imageUrl']),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${profile['name']}, ${profile['age']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.interbold,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: profile['isOnline'] ?? false
                                ? TColors.online
                                : TColors.offline,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(
                            ImageStrings.location,
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              profile['location'] ?? 'Unknown Location',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.interregular,
                                fontWeight: FontWeight.w500,
                                color: TColors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LikesView extends StatelessWidget {
  const LikesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profiles = [
      {
        'imageUrl': ImageStrings.profile1,
        'name': 'Eleanor Pena',
        'age': 20,
        'status': 'Online',
        'isOnline': true,
        'location': 'Toledo'
      },
      {
        'imageUrl': ImageStrings.profile2,
        'name': 'Jenny Wilson',
        'age': 24,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Austin'
      },
      {
        'imageUrl': ImageStrings.profile3,
        'name': 'Jacob Jones',
        'age': 28,
        'status': 'Online',
        'isOnline': true,
        'location': 'Toledo'
      },
      {
        'imageUrl': ImageStrings.profile4,
        'name': 'Cameron Pena',
        'age': 30,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Fairfield'
      },
      {
        'imageUrl': ImageStrings.profile5,
        'name': 'Savannah Nguy',
        'age': 21,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Naperville'
      },
      {
        'imageUrl': ImageStrings.profile6,
        'name': 'Annette Black',
        'age': 31,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Orange'
      },
      {
        'imageUrl': ImageStrings.profile7,
        'name': 'Cody Fisher',
        'age': 32,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Pembroke Pines'
      },
      {
        'imageUrl': ImageStrings.profile8,
        'name': 'Emily Davis',
        'age': 25,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Fairfield'
      }
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        final profile = profiles[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: (index ~/ 2).isEven ? TColors.cardodd : TColors.cardeven,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 112,
                    width: 112,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(profile['imageUrl']),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${profile['name']}, ${profile['age']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.interbold,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: profile['isOnline'] ?? false
                                ? TColors.online
                                : TColors.offline,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(
                            ImageStrings.location,
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              profile['location'] ?? 'Unknown Location',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.interregular,
                                fontWeight: FontWeight.w400,
                                color: TColors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
