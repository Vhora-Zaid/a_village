import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllValidators {
  static String? validateEmail(String? value, BuildContext context) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return AppLocalizations.of(context)!.emailrequired;
    }
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(nonNullValue)) {
      return AppLocalizations.of(context)!.emailinvalid;
    }
    return null;
  }

  static String? validateLoginPassword(String? value, BuildContext context) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return AppLocalizations.of(context)!.passwordrequired;
    }
    String pattern = r'^.{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(nonNullValue)) {
      return AppLocalizations.of(context)!.passlength;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return AppLocalizations.of(context)!.passwordrequired;
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(nonNullValue)) {
      return AppLocalizations.of(context)!.passwordinvalid;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String? originalPassword, BuildContext context) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return AppLocalizations.of(context)!.passwordrequired;
    }
    if (nonNullValue != originalPassword) {
      return AppLocalizations.of(context)!.passmismatch;
    }
    return null;
  }

  static String? validateName(String? value, BuildContext context) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return AppLocalizations.of(context)!.namerequired;
    }
    return null;
  }

  static String? validatePhoneNumber(
      String? value, String selectedCountryCode, List<Map<String, dynamic>> countryData) {
    if (selectedCountryCode.isEmpty) {
      return 'Please select a country code';
    }

    final selectedCountry = countryData.firstWhere(
          (country) => country['code'] == selectedCountryCode,
      orElse: () => const <String, dynamic>{},
    );

    if (selectedCountry.isEmpty || !selectedCountry.containsKey('regex')) {
      return 'Invalid country selection';
    }

    final String regexPattern = selectedCountry['regex'] as String;
    final RegExp regex = RegExp(regexPattern);

    String sanitizedValue = value?.replaceAll(RegExp(r'[^\d+]'), '') ?? '';

    if (sanitizedValue.startsWith('+')) {
      sanitizedValue = sanitizedValue.substring(1);
    }

    if (!regex.hasMatch(sanitizedValue)) {
      return 'Invalid number format for ${selectedCountry['name'] ?? 'this country'}';
    }

    return null;
  }





}
