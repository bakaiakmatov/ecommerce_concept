import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_styles.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  @override
  Widget build(BuildContext context) {
    int _current = 0;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hot Sales',
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
            height: ScreenUtil().setHeight(182),
            // width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      imageUrl: images[index],
                      // height: 182.h,
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
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 27.h,
                            width: 27.w,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.persimmonColor,
                                borderRadius: BorderRadius.circular(64.w),
                              ),
                              child: Center(
                                child: Text(
                                  '\$',
                                  style: AppStyles.text10w700.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 18.h),
                          Text(
                            'Iphone 12',
                            style: AppStyles.text25w700.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Súper. Mega. Rápido.',
                            style: AppStyles.text12w400.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 26.h),
                          InkWell(
                            onTap: () {},
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                              ),
                              child: SizedBox(
                                width: ScreenUtil().setWidth(98),
                                height: ScreenUtil().setHeight(23),
                                child: Center(
                                  child: Text(
                                    'Buy now!',
                                    style: AppStyles.text11w700.copyWith(
                                      color: AppColors.stratosColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.stratosColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
              // height: ScreenUtil().setHeight(182),
              // width: double.infinity,
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(10.w),
              //   child: CarouselSlider(
              //     items: images.map((i) {
              //       return
              //     }).toList(),
              //     options: CarouselOptions(
              //       autoPlay: true,
              //       viewportFraction: 1,
              //       onPageChanged: (index, reason) {
              //         setState(() {
              //           _current = index;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              ),
        ],
      ),
    );
  }
}
