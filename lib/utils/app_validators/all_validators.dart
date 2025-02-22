import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllValidators {

  static String? validateEmail(String? value, BuildContext context) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return AppLocalizations.of(context)!.emailrequired;
    }
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(nonNullValue)) {
      return AppLocalizations.of(context)!.emailinvalid;
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

static String? validateName(String? value, BuildContext context) {
  var nonNullValue = value ?? '';
  if (nonNullValue.isEmpty) {
    return AppLocalizations.of(context)!.namerequired;
  }
  return null;
}


}