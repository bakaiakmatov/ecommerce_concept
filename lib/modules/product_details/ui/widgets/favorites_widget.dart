import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_colors.dart';

class FavoritesWidget extends StatelessWidget {
  final bool isFavorites;
  const FavoritesWidget({Key? key, required this.isFavorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      child: ColoredBox(
        color: AppColors.stratosColor,
        child: SizedBox(
          width: 33.w,
          height: 33.h,
          child: isFavorites
              ? const Icon(
                  Icons.favorite,
                  color: AppColors.persimmonColor,
                  size: 14,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: AppColors.whiteColor,
                  size: 14,
                ),
        ),
      ),
    );
  }
}
