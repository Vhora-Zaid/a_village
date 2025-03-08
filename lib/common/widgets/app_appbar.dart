import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  Widget? leading;
  List<Widget>? actions;
  Color? color;
  double? fontSize;
  VoidCallback? onTap;

  MyAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.color,
    this.onTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: TColors.white,
      elevation: 0,
      title: Text(
        title == null ? '' : title!,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.interbold,
        ),
      ),
      centerTitle: false,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
