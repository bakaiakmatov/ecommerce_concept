import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:ecommerce_concept/resources/app_icons.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(32),
        right: ScreenUtil().setWidth(32),
        top: ScreenUtil().setHeight(35),
        bottom: ScreenUtil().setHeight(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: SizedBox(
                height: 36.h,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    hintText: 'Search',
                    hintStyle: AppStyles.text12w400,
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.persimmonColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          InkWell(
            borderRadius: BorderRadius.circular(50.0),
            splashColor: AppColors.stratosColor,
            onTap: () {
              print('Search');
            },
            child: SizedBox(
              height: 34.h,
              width: 34.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.persimmonColor,
                  borderRadius: BorderRadius.circular(64.0.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppIconPaths.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
