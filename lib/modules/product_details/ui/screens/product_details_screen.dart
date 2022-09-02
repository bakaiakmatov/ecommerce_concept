import 'package:ecommerce_concept/common_widgets/custom_appbar.dart';
import 'package:ecommerce_concept/modules/product_details/api/client/product_details_api.dart';
import 'package:ecommerce_concept/modules/product_details/interactor/product_details_repository.dart';
import 'package:ecommerce_concept/modules/product_details/ui/screens/product_details_screen_provider.dart';
import 'package:ecommerce_concept/modules/product_details/ui/widgets/shop_widget.dart';
import 'package:ecommerce_concept/modules/product_details/ui/widgets/tab_bar_widget.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../resources/app_colors.dart';
import '../widgets/slider_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsScreenProvider(
        repository: ProductDetailsRepository(
          client: GetIt.I.get<ProductDetailsApi>(),
        ),
      ),
      child: Consumer<ProductDetailsScreenProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: CustomAppbar(
            icon: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: ColoredBox(
                  color: AppColors.stratosColor,
                  child: SizedBox(
                    width: 37.w,
                    height: 37.h,
                    child: const Padding(
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.backgroundWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              'Product Details',
              style: AppStyles.text18w500.copyWith(color: AppColors.stratosColor),
            ),
            rightIcon: SizedBox(
              width: 37.w,
              height: 37.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: const ColoredBox(
                  color: AppColors.persimmonColor,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.stratosColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 350.h,
                  child: SliderWidget(
                    images: provider.productDetails?.images ?? [],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 500.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.stratosColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 28.h,
                        left: 33.w,
                        right: 33.w,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.productDetails?.title ?? '',
                                    style: AppStyles.text24w500.copyWith(
                                      color: AppColors.stratosColor,
                                    ),
                                  ),
                                  RatingBar.builder(
                                    initialRating: provider.productDetails?.rating ?? 0,
                                    itemSize: 24,
                                    minRating: 1,
                                    ignoreGestures: true,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: AppColors.lemonColor,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                child: ColoredBox(
                                  color: AppColors.stratosColor,
                                  child: SizedBox(
                                    width: 33.w,
                                    height: 33.h,
                                    child: provider.productDetails?.isFavorites ?? false
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
                              ),
                            ],
                          ),
                          SizedBox(height: 32.h),
                          TabBarWidget(
                            widget: ShopWidget(
                              color: provider.productDetails?.color ?? [],
                              capacity: provider.productDetails?.capacity ?? [],
                              price: provider.productDetails?.price ?? 0,
                              cpu: provider.productDetails?.cpu ?? 'unknown',
                              camera: provider.productDetails?.camera ?? '',
                              ssd: provider.productDetails?.ssd ?? '',
                              sd: provider.productDetails?.sd ?? '',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
