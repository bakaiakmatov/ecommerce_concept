import 'package:ecommerce_concept/modules/product_details/ui/res/phone_characteristics.dart';
import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/app_styles.dart';

class RowCharacteristic extends StatelessWidget {
  final String cpu;
  final String camera;
  final String ssd;
  final String sd;
  const RowCharacteristic({
    Key? key,
    required this.cpu,
    required this.camera,
    required this.ssd,
    required this.sd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characteristics = PhoneCharacteristics.phoneCharacteristicsList;
    final style = AppStyles.text11w700.copyWith(color: AppColors.grayColor);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SvgPicture.asset(characteristics[0].icon),
            SizedBox(height: 6.h),
            Text(
              cpu,
              style: style,
            )
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(characteristics[1].icon),
            SizedBox(height: 6.h),
            Text(
              camera,
              style: style,
            )
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(characteristics[2].icon),
            SizedBox(height: 6.h),
            Text(
              ssd,
              style: style,
            )
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(characteristics[3].icon),
            SizedBox(height: 6.h),
            Text(
              sd,
              style: style,
            )
          ],
        ),
      ],
    );
  }
}
