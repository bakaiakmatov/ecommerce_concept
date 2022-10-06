import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_styles.dart';

class CustomButtonWidget extends StatelessWidget {
  final int? price;
  final String title;
  const CustomButtonWidget({
    Key? key,
    this.price,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('Tab');
      },
      child: SizedBox(
        height: 58.h,
        width: double.maxFinite,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.persimmonColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppStyles.text20w700.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                if (price != null) const Spacer(),
                price != null
                    ? Text(
                        '$price',
                        style: AppStyles.text20w700.copyWith(
                          color: AppColors.whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
