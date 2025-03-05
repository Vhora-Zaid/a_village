import 'package:flutter/material.dart';

import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';

class AppButton extends StatelessWidget {
  String? title;
  Function()? onTap;

  AppButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          gradient: TColors.mainGradient,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(
          title == null ? '' : title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.interbold,
          ),
        ),
      ),
    );
  }
}

class AppButton2 extends StatelessWidget {
  String? title;
  Function()? onTap;
  Color? color;
  Color? textColor;

  AppButton2({super.key, required this.title, required this.onTap, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 226,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(
          title == null ? '' : title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.interbold,
          ),
        ),
      ),
    );
  }
}

