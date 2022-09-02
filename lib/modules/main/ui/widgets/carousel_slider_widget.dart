import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_concept/modules/main/domain/main_products.dart';
import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_styles.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<HomeStore> info;
  const CarouselSliderWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _selectedPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  late final Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_selectedPage < 2) {
        _selectedPage++;
      } else {
        _selectedPage = 0;
      }

      _pageController.animateToPage(
        _selectedPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

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
            height: 200,
            width: double.maxFinite,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.info.length,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              // onPageChanged: _pageChanged,
              itemBuilder: (context, index) => Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    imageUrl: widget.info[index].picture,
                    imageBuilder: (context, imageProvider) => Container(
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: AppColors.stratosColor,
                      ),
                    ),
                    colorBlendMode: BlendMode.xor,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.info[index].isNew == true)
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
                                    'New!',
                                    style: AppStyles.text10w700.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: 18.h),
                          Text(
                            widget.info[index].title,
                            style: AppStyles.text25w700.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            widget.info[index].subtitle,
                            style: AppStyles.text12w400.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 26.h),
                          if (widget.info[index].isBuy == true)
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
          )
        ],
      ),
    );
  }
}
