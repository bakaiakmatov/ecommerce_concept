import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCardWidget extends StatelessWidget {
  final String icon;
  final String text;
  const CategoryCardWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0.h),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50.0),
            splashColor: AppColors.stratosColor,
            onTap: () {},
            child: SizedBox(
              height: 71.h,
              width: 71.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(64.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.stratosColor.withOpacity(0.1),
                      offset: Offset(0.0, 4.h),
                      blurRadius: 8.w,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: SvgPicture.asset(icon),
                ),
              ),
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            text,
            style: AppStyles.text12w500.copyWith(
              color: AppColors.stratosColor,
            ),
          )
        ],
      ),
    );
  }
}
