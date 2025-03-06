import 'package:a_village/common/widgets/interest_selection.dart';
import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 130,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 6,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return Image.network(
                              'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
                              // height: 726,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          case 1:
                            return Image.network(
                              'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
                              // height: 726,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          case 2:
                            return Image.network(
                              'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
                              // height: 726,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          case 3:
                            return Image.network(
                              'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
                              // height: 726,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          case 4:
                            return Image.network(
                              'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
                              // height: 726,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          case 5:
                            return Image.network(
                              'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
                              // height: 726,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          case 6:
                            return Image.network(
                              'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
                              // height: 726,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 40),
                      child: Image.asset(
                        ImageStrings.backarrow,
                        height: 44,
                        width: 44,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => Container(
                          width: 47.17,
                          height: 2,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _currentPage == index
                                ? TColors.white
                                : TColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 29, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.eleanor,
                              style: TextStyle(
                                color: TColors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.interbold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '23',
                              style: TextStyle(
                                color: TColors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.interbold,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: TColors.online,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              ImageStrings.homefavorite,
                              color: TColors.black,
                              height: 24,
                              width: 24,
                            ),
                            PopupMenuButton<String>(
                              position: PopupMenuPosition.under,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: TColors.white,
                              elevation: 6,
                              icon: Icon(
                                Icons.more_vert,
                                color: TColors.black,
                              ),
                              onSelected: (value) {
                                if (value == 'Report') {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      TextEditingController reportController =
                                          TextEditingController();
                                      return AlertDialog(
                                        scrollable: true,
                                        backgroundColor: TColors.white,
                                        insetPadding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        title: Text(
                                          AppLocalizations.of(context)!
                                              .report,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppFonts.interbold,
                                            color: TColors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .whyreport,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    AppFonts.interregular,
                                                color: TColors.black,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 12),
                                            TextField(
                                              controller: reportController,
                                              cursorColor: TColors.placeholder,
                                              maxLines: 15,
                                              decoration: InputDecoration(
                                                hintText: AppLocalizations.of(
                                                        context)!
                                                    .enterreason,
                                                hintStyle: TextStyle(
                                                  color: TColors.placeholder,
                                                  fontSize: 14,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color: TColors.stroke),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color: TColors.placeholder),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .cancel,
                                              style: TextStyle(
                                                  color: TColors.placeholder),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: TColors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Fluttertoast.showToast(
                                                msg: AppLocalizations.of(
                                                        context)!
                                                    .reportsent,
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: TColors.blue,
                                                textColor: TColors.white,
                                                fontSize: 14,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .report,
                                              style: TextStyle(
                                                  color: TColors.white),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (value == 'Block') {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        backgroundColor: TColors.white,
                                        title: Text(
                                          AppLocalizations.of(context)!
                                              .blockuser,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: TColors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Text(
                                          AppLocalizations.of(context)!
                                              .sureblock,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: TColors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .cancel,
                                              style: TextStyle(
                                                  color: TColors.placeholder),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: TColors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Fluttertoast.showToast(
                                                msg: AppLocalizations.of(
                                                        context)!
                                                    .userblocked,
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor:
                                                    Colors.redAccent,
                                                textColor: TColors.white,
                                                fontSize: 14,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .block,
                                              style: TextStyle(
                                                  color: TColors.white),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Report',
                                  child: ListTile(
                                    leading: Icon(Icons.report,
                                        color: Colors.redAccent),
                                    title: Text(
                                      AppLocalizations.of(context)!.report,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Block',
                                  child: ListTile(
                                    leading:
                                        Icon(Icons.block, color: TColors.black),
                                    title: Text(
                                      AppLocalizations.of(context)!.block,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      AppLocalizations.of(context)!.aboutele,
                      style: TextStyle(
                        color: TColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.interbold,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      AppLocalizations.of(context)!.lorem,
                      style: TextStyle(
                        color: TColors.aboutuser,
                        fontSize: 14,
                        fontFamily: AppFonts.interregular,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      AppLocalizations.of(context)!.interest,
                      style: TextStyle(
                        color: TColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.interbold,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    UserInterestSelection(),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: TColors.functionbutton,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: TColors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 65),
                                child: Image.asset(
                                  ImageStrings.homeclose,
                                  scale: 4,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: TColors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 65),
                                child: Image.asset(
                                  ImageStrings.homecheck,
                                  scale: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
