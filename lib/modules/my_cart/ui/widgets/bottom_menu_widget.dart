import 'package:ecommerce_concept/common_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class BottomMenuWidget extends StatelessWidget {
  final int total;
  final String delivery;
  const BottomMenuWidget({
    Key? key,
    required this.total,
    required this.delivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.grayColor,
          height: 0.5,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Text(
              'Total',
              style: AppStyles.text15w400.copyWith(color: AppColors.whiteColor),
            ),
            const Spacer(),
            Text(
              '\$ $total us',
              style: AppStyles.text15w700.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Text(
              'Delivery',
              style: AppStyles.text15w400.copyWith(color: AppColors.whiteColor),
            ),
            const Spacer(),
            Text(
              delivery,
              style: AppStyles.text15w700.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const Divider(
          color: AppColors.grayColor,
          height: 0.5,
        ),
        SizedBox(height: 32.h),
        const CustomButtonWidget(title: 'Checkout')
      ],
    );
  }
}
