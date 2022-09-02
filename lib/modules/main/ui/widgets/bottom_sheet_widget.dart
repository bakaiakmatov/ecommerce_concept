import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/custom_dropdown_button.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class BottomSheetWidget extends StatelessWidget {
  final List<String> brand;
  final List<String> price;
  final List<String> size;
  const BottomSheetWidget({
    Key? key,
    required this.brand,
    required this.price,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0.h, left: 16.0.w, right: 16.0.w, bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.w),
                  child: ColoredBox(
                    color: AppColors.stratosColor,
                    child: SizedBox(
                      width: 37.w,
                      height: 37.h,
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: AppColors.backgroundWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Filter options',
                style: AppStyles.text18w500.copyWith(
                  color: AppColors.stratosColor,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: ColoredBox(
                  color: AppColors.persimmonColor,
                  child: SizedBox(
                    child: Center(
                      child: TextButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 19.h),
                          child: Text(
                            'Done',
                            style: AppStyles.text18w500.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Brand',
            style: AppStyles.text18w500.copyWith(color: AppColors.stratosColor),
          ),
          SizedBox(height: 12.h),
          CustomDropdownButton(
            hintText: 'Select brand',
            items: brand
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: AppStyles.text16w700.copyWith(color: AppColors.stratosColor),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
          SizedBox(height: 12.h),
          Text(
            'Price',
            style: AppStyles.text18w500.copyWith(color: AppColors.stratosColor),
          ),
          SizedBox(height: 12.h),
          CustomDropdownButton(
            hintText: 'Select Price',
            items: price
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: AppStyles.text16w700.copyWith(color: AppColors.stratosColor),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
          SizedBox(height: 12.h),
          Text(
            'Size',
            style: AppStyles.text18w500.copyWith(color: AppColors.stratosColor),
          ),
          SizedBox(height: 12.h),
          CustomDropdownButton(
            hintText: 'Select Size',
            items: size
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: AppStyles.text16w700.copyWith(color: AppColors.stratosColor),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
