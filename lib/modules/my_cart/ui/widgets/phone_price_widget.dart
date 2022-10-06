import 'package:flutter/material.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class PhonePriceWidget extends StatelessWidget {
  final String title;
  final int price;
  const PhonePriceWidget({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.text20w500.copyWith(color: AppColors.whiteColor),
        ),
        Text(
          '\$ $price',
          style: AppStyles.text20w500.copyWith(color: AppColors.persimmonColor),
        )
      ],
    );
  }
}
