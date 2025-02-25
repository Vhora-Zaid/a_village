import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';


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

  static Widget phoneTextField({
    required TextEditingController phoneController,
    String? selectedCountryCode,
    required List countryData,
    VoidCallback? onTap,
    VoidCallback? onEditingComplete,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      keyboardType: TextInputType.phone,
      controller: phoneController,
      cursorColor: const Color(0xff3E1D0D),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 11, 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xffE8E8E8),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xffE8E8E8),
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        hintText: 'Mobile',
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xff8D8E8D),
          fontWeight: FontWeight.w400,
          fontFamily: 'BeVietnamRegular',
        ),
        prefixIcon: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: DropdownButton<String>(
              value: selectedCountryCode,
              items: countryData.map((country) {
                final uniqueValue =
                    '${country['code']}|${country['name']}';
                return DropdownMenuItem<String>(
                  value: uniqueValue,
                  child: Row(
                    children: [
                      Text(
                        country['flag']!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        country['code']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'BeVietnamRegular',
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                // setState(() {
                //   selectedCountryCode = value!;
                // });
              },
            ),
          ),
        ),
      ),
    );
  }

  static PinCodeTextField pinCodeTextField({
    required BuildContext appContext,
    required Function(String verificationCode) onCompleted,
  }) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      appContext: appContext,
      pastedTextStyle: const TextStyle(
        color: TColors.black,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.interbold,
        fontSize: 17
      ),
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(50),
        fieldHeight: 45,
        fieldWidth: 45,
        selectedColor: TColors.blue,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        activeColor: TColors.blue,
        inactiveColor: const Color(0xffE8E8E8),
      ),
      cursorColor: TColors.blue,
      animationDuration: const Duration(milliseconds: 200),
      onCompleted: (String verificationCode) {
        onCompleted(verificationCode);
      },
    );
  }

}

