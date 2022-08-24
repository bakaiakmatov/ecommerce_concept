import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomBottomSheet(
  BuildContext context,
  Widget widget,
) =>
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: widget,
        );
      },
    );
