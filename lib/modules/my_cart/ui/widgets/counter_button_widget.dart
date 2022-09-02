import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class CounterButtonWidget extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final int counter;
  const CounterButtonWidget({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(26)),
      child: SizedBox(
        width: 26.w,
        child: ColoredBox(
          color: AppColors.dustyGray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: increment,
                child: Text(
                  '+',
                  style: AppStyles.text20w700.copyWith(color: AppColors.whiteColor),
                ),
              ),
              Text(
                '$counter',
                style: AppStyles.text20w500.copyWith(color: AppColors.whiteColor),
              ),
              GestureDetector(
                onTap: decrement,
                child: Text(
                  '-',
                  style: AppStyles.text20w700.copyWith(color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
