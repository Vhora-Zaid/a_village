import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class LanguageContainer {
  static Widget container({
    double? width,
    double? height,
    Color borderColor = Colors.black,
    double borderRadius = 15.0,
    Color? color,
    AlignmentGeometry? alignment,
    String text = '',
    String imagePath = '',
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: alignment,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 27,
                color: textColor,
                fontFamily: AppFonts.interbold,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  ImageStrings.arrowRight,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}