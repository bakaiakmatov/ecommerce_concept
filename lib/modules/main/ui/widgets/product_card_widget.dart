import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_concept/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';
import '../../domain/main_products.dart';

class ProductCardWidget extends StatelessWidget {
  final List<BestSeller> bestSeller;
  final ValueChanged<int> onFavouritesChanged;
  const ProductCardWidget({
    Key? key,
    required this.bestSeller,
    required this.onFavouritesChanged,
  }) : super(key: key);

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
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.w,
              crossAxisSpacing: 8.h,
              childAspectRatio: 0.9,
            ),
            children: bestSeller
                .map(
                  (e) => DecoratedBox(
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
                          InkWell(
                            onDoubleTap: () {
                              Navigator.pushNamed(context, AppRoutes.productDetailsScreen);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  height: 132.h,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  imageUrl: e.picture,
                                  errorWidget: (context, url, error) => const SizedBox(
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: AppColors.stratosColor,
                                      ),
                                    ),
                                    width: 32,
                                    height: 8,
                                  ),
                                  colorBlendMode: BlendMode.xor,
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${e.discountPrice}',
                                      style: AppStyles.text16w700.copyWith(
                                        color: AppColors.stratosColor,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      '${e.priceWithoutDiscount}',
                                      style: AppStyles.text10w500.copyWith(
                                        color: AppColors.grayColor,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: AppColors.grayColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Expanded(
                                  child: Text(
                                    e.title,
                                    style: AppStyles.text10w400,
                                  ),
                                )
                              ],
                            ),
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
                                child: GestureDetector(
                                  onTap: () {
                                    onFavouritesChanged.call(e.id ?? 0);
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: (e.isFavorites ?? false) ? AppColors.grayColor : AppColors.persimmonColor,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
