import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final String imagePath;
  final String? suffixImage;
  final bool obscureText;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.errorText,
    this.imagePath = '',
    this.suffixImage,
    this.obscureText = false,
    this.onTap,
    this.onEditingComplete,
    this.validator,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      autovalidateMode:
          widget.validator != null ? AutovalidateMode.onUserInteraction : null,
      validator: widget.validator,
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
              widget.imagePath,
              scale: 4,
            )),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
            widget.onTap?.call();
          },
          child: Padding(
            padding: EdgeInsets.only(right: 5),
            child: widget.suffixImage == null
                ? null
                : Image.asset(
                    _obscureText ? widget.suffixImage! : ImageStrings.eye,
                    scale: 4,
                  ),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Color(0xff989898),
          fontFamily: AppFonts.interregular,
        ),
      ),
    );
  }
}

class PhoneTextField extends StatefulWidget {
  final TextEditingController phoneController;
  final String? initialCountryCode;
  final List<Map<String, dynamic>> countryData;
  final void Function(String) onCountryCodeChanged;
  final String? Function(String?, String) validator;

  const PhoneTextField({
    Key? key,
    required this.phoneController,
    this.initialCountryCode,
    required this.countryData,
    required this.onCountryCodeChanged,
    required this.validator,
  }) : super(key: key);

  @override
  _PhoneTextFieldState createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  late String selectedCountryCode;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    selectedCountryCode = widget.initialCountryCode ??
        (widget.countryData.isNotEmpty
            ? widget.countryData.first['code']
            : '+1');
  }

  void validatePhoneNumber() {
    setState(() {
      errorMessage =
          widget.validator(widget.phoneController.text, selectedCountryCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.phoneController,
          keyboardType: TextInputType.phone,
          onChanged: (_) => validatePhoneNumber(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  const BorderSide(color: Color(0xffDBDDE2), width: 1.0),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCountryCode,
                  items: widget.countryData.map((country) {
                    return DropdownMenuItem<String>(
                      value: country['code'],
                      child: Row(
                        children: [
                          Text(
                            country['flag'] ?? '🌍',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            country['code'],
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedCountryCode = value;
                      });
                      widget.onCountryCodeChanged(value);
                      validatePhoneNumber();
                    }
                  },
                  alignment: AlignmentDirectional.center,
                  dropdownColor: TColors.white,
                ),
              ),
            ),
            hintText: "Enter mobile number",
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xff8D8E8D)),
            errorText: errorMessage, // ✅ Show error only once
          ),
        ),
      ],
    );
  }
}

class PinCodeTextFieldWidget extends StatelessWidget {
  final BuildContext appContext;
  final Function(String verificationCode) onCompleted;

  const PinCodeTextFieldWidget({
    Key? key,
    required this.appContext,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      appContext: appContext,
      pastedTextStyle: const TextStyle(
        color: TColors.black,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.interbold,
        fontSize: 17,
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
