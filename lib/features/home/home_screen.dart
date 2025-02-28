import 'package:a_village/common/widgets/app_bottomnavigation.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/app_appbar.dart';
import '../../utils/constants/app_fonts.dart';
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
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Image.asset(ImageStrings.homeapplogo, scale: 4),
              // SizedBox(width: 10.43,),
              // Image.asset(ImageStrings.avillage, height: 22.75, width: 89.57,),
            ],
          ),
        ),
        title: AppLocalizations.of(context)!.village,
        color: TColors.black,
        fontSize: 27,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: GestureDetector(
              child: Image.asset(
                ImageStrings.search,
                height: 24,
                width: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                ImageStrings.notificationlogo,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
          child: Column(
            children: [
              Container(
                height: 514,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffEEEEEE),
                      spreadRadius: -22,
                      blurRadius: 0,
                      offset: Offset(0, 44),
                    ),
                    BoxShadow(
                      color: Color(0xffD8D8D8),
                      spreadRadius: -12,
                      blurRadius: 0,
                      offset: Offset(0, 25),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      ImageStrings.homecard,
                      fit: BoxFit.fill,
                      height: 514,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 303, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 98,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImageStrings.location,
                                  height: 18,
                                  width: 18,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.california,
                                  style: TextStyle(
                                    color: TColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.interregular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Angel',
                                style: TextStyle(
                                  fontSize: 37,
                                  fontFamily: AppFonts.interbold,
                                  color: TColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                '27',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: AppFonts.interbold,
                                  color: TColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Hey there. My name is Angel and I’m a fashion photographer. I love going to convert and festivals.',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.interregular,
                              color: TColors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 13),
                                    child: Text(
                                      'Art',
                                      style: TextStyle(
                                        color: TColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFonts.interregular,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 13),
                                    child: Text(
                                      'Fashion',
                                      style: TextStyle(
                                        color: TColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFonts.interregular,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 13),
                                    child: Text(
                                      'Photography',
                                      style: TextStyle(
                                        color: TColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFonts.interregular,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xffF6F1D3),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        // width: 108,
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 39),
                          child: Image.asset(ImageStrings.homeclose, height: 24, width: 24,),
                        ),
                      ),
                      Container(
                        height: 60,
                        // width: 108,
                        decoration: BoxDecoration(
                          gradient: TColors.mainGradient,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 39),
                          child: Image.asset(ImageStrings.homefavorite, height: 24, width: 24,),
                        ),
                      ),
                      Container(
                        height: 60,
                        // width: 108,
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 39),
                          child: Image.asset(ImageStrings.homecheck, height: 24, width: 24,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
