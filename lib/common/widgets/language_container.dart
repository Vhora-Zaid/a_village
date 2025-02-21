import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class LanguageContainer {
  static Widget container({
    double? width,
    double? height,
    bool isBorder = false,
    Color borderColor = Colors.black,
    double borderWidth = 1.0,
    double borderRadius = 15.0,
    Color? color,
    AlignmentGeometry? alignment,
    String text = '',
    String imagePath = '',
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: isBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      alignment: alignment,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath.isNotEmpty
              ?
          Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                )
              : const SizedBox(),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontFamily: 'Inter Tight',
            ),
          ),
          SizedBox(
            width: 52,
          ),
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
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
    );
  }
}