import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_routes.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.stratosColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 66.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: AppColors.whiteColor,
                    size: 8,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    'Explorer',
                    style: AppStyles.text15w700.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.myCartScreen);
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.whiteColor,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.productDetailsScreen);
                },
                icon: const Icon(
                  Icons.favorite_outline,
                  color: AppColors.whiteColor,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRoutes.myCartScreen);
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: AppColors.whiteColor,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
