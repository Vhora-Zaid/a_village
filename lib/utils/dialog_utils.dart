import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:fluttertoast/fluttertoast.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants/app_fonts.dart';
import 'constants/colors.dart';

void showOkCancelAlertDialog({
  required BuildContext context,
  required String message,
  required String okButtonTitle,
  required String cancelButtonTitle,
  required Function cancelButtonAction,
  required Function okButtonAction,
  bool isCancelEnable = true,
}) {
  showDialog(
    barrierDismissible: isCancelEnable,
    context: context,
    builder: (context) {
      return Platform.isIOS
          ? _showOkCancelCupertinoAlertDialog(
              context,
              message,
              okButtonTitle,
              cancelButtonTitle,
              okButtonAction,
              isCancelEnable,
              cancelButtonAction,
            )
          : _showOkCancelMaterialAlertDialog(
              context,
              message,
              okButtonTitle,
              cancelButtonTitle,
              okButtonAction,
              isCancelEnable,
              cancelButtonAction,
            );
    },
  );
}

void showAlertDialog({
  required BuildContext context,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Platform.isIOS
          ? _showCupertinoAlertDialog(context, message)
          : _showMaterialAlertDialog(context, message);
    },
  );
}

CupertinoAlertDialog _showCupertinoAlertDialog(
    BuildContext context, String message) {
  return CupertinoAlertDialog(
    title: Text(
      AppLocalizations.of(context)!.appname,
      // style: Theme.of(context).textTheme.displayLarge,
    ),
    content: Text(
      message,
      // style: Theme.of(context).textTheme.displayMedium,
    ),
    actions: _actions(context),
  );
}

AlertDialog _showMaterialAlertDialog(BuildContext context, String message) {
  return AlertDialog(
    title: Text(
      AppLocalizations.of(context)!.appname,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      //  Theme.of(context).textTheme.displayMedium,
    ),
    actions: _actions(context),
  );
}

AlertDialog _showOkCancelMaterialAlertDialog(
  BuildContext context,
  String message,
  String okButtonTitle,
  String cancelButtonTitle,
  Function okButtonAction,
  bool isCancelEnable,
  Function cancelButtonAction,
) {
  return AlertDialog(
    backgroundColor: TColors.white,
    title: Text(
      AppLocalizations.of(context)!.appname,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    ),
    actions: _okCancelActions(
      context: context,
      okButtonTitle: okButtonTitle,
      cancelButtonTitle: cancelButtonTitle,
      okButtonAction: okButtonAction,
      isCancelEnable: isCancelEnable,
      cancelButtonAction: cancelButtonAction,
    ),
  );
}

CupertinoAlertDialog _showOkCancelCupertinoAlertDialog(
  BuildContext context,
  String message,
  String okButtonTitle,
  String cancelButtonTitle,
  Function okButtonAction,
  bool isCancelEnable,
  Function cancelButtonAction,
) {
  return CupertinoAlertDialog(
    title: Text(
      AppLocalizations.of(context)!.appname,
    ),
    content: Text(
      message,
    ),
    actions: isCancelEnable
        ? _okCancelActions(
            context: context,
            okButtonTitle: okButtonTitle,
            cancelButtonTitle: cancelButtonTitle,
            okButtonAction: okButtonAction,
            isCancelEnable: isCancelEnable,
            cancelButtonAction: cancelButtonAction,
          )
        : _okAction(
            context: context,
            okButtonAction: okButtonAction,
            okButtonTitle: okButtonTitle,
          ),
  );
}

List<Widget> _actions(BuildContext context) {
  return <Widget>[
    Platform.isIOS
        ? CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        : TextButton(
            child: Text(AppLocalizations.of(context)!.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
  ];
}

List<Widget> _okCancelActions({
  required BuildContext context,
  required String okButtonTitle,
  required String cancelButtonTitle,
  required Function okButtonAction,
  required bool isCancelEnable,
  required Function cancelButtonAction,
}) {
  return <Widget>[
    Platform.isIOS
        ? CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              cancelButtonAction();
            },
            child: Text(
              cancelButtonTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.interregular,
                color: TColors.placeholder,
              ),
            ),
          )
        : TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              cancelButtonAction();
            },
            child: Text(
              cancelButtonTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.interregular,
                color: TColors.placeholder,
              ),
            ),
          ),
    Platform.isIOS
        ? CupertinoDialogAction(
            child: Text(
              okButtonTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.interregular,
                color: TColors.blue,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              okButtonAction();
            },
          )
        : TextButton(
            child: Text(
              okButtonTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.interregular,
                color: TColors.blue,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              okButtonAction();
            },
          ),
  ];
}

List<Widget> _okAction({
  required BuildContext context,
  required String okButtonTitle,
  required Function okButtonAction,
}) {
  return <Widget>[
    Platform.isIOS
        ? CupertinoDialogAction(
            child: Text(
              okButtonTitle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              okButtonAction();
            },
          )
        : TextButton(
            child: Text(
              okButtonTitle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              okButtonAction();
            },
          ),
  ];
}

SnackBar displaySnackBar({
  required String message,
  required BuildContext context,
}) {
  return SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
    backgroundColor: TColors.secondary,
  );
}

Future displayToast({required String message}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 3,
    backgroundColor: TColors.secondary,
    textColor: TColors.white,
    fontSize: 14,
  );
}

