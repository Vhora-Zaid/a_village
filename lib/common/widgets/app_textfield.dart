import 'package:flutter/material.dart';

import '../../utils/constants/app_fonts.dart';

class AppTextField {
  static Widget simpleTextField({
    TextEditingController? controller,
    String? hintText,
    String? errorText,
    String imagePath = '',
    String? suffixImage,
    VoidCallback? onTap,
    VoidCallback? onEditingComplete,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode:
          validator != null ? AutovalidateMode.onUserInteraction : null,
      validator: validator,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Color(0xff3E1D0D),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 11, 15),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xffDBDDE2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xffDBDDE2),
            width: 1.0,
          ),
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              imagePath,
              scale: 4,
            )),
        suffixIcon: GestureDetector(
          onTap: () {
          },
          child: Padding(
            padding: EdgeInsets.only(right: 5),
            child: suffixImage == null ? null : Image.asset(suffixImage, scale: 4),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Color(0xff989898),
          fontFamily: AppFonts.interregular,
        ),
      ),
    );
  }
}
