import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Seller',
                style: AppStyles.text25w700.copyWith(
                  color: AppColors.stratosColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'see more',
                  style: AppStyles.text15w400.copyWith(
                    color: AppColors.persimmonColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 227.h,
            width: 181.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.whiteColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                  top: 8.h,
                  bottom: 16.h,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            'https://svetofor.info/images/detailed/217/smartfon-samsung-galaxy-s21-ultra-5g-256-gb-ram-12-gb-black.jpg',
                            fit: BoxFit.cover),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$1,047',
                              style: AppStyles.text16w700.copyWith(
                                color: AppColors.stratosColor,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '\$1,500',
                              style: AppStyles.text10w500.copyWith(
                                color: AppColors.grayColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.grayColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Samsung Galaxy s20 Ultra',
                          style: AppStyles.text10w400,
                        )
                      ],
                    ),
                    Positioned(
                      top: 8.0.h,
                      right: 0.0.w,
                      child: SizedBox(
                        width: 25.w,
                        height: 25.h,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.stratosColor.withOpacity(0.2),
                                offset: const Offset(0.0, 4.0),
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                            ),
                            color: AppColors.persimmonColor,
                            iconSize: 18.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
