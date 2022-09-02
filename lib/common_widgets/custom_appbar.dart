import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.h);
  final Widget? icon;
  final Widget? title;
  final Widget? rightIcon;

  const CustomAppbar({
    Key? key,
    this.icon,
    this.title,
    this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon ?? const SizedBox(),
            if (title != null) title!,
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }
}
