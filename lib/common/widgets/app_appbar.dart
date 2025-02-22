import 'package:a_village/utils/constants/image_strings.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title == null ? '' : title!,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: onTap,
          child: Image.asset(
            ImageStrings.backarrow,
            height: 44,
            width: 44,
          ),
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
