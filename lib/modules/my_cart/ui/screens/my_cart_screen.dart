import 'package:ecommerce_concept/modules/my_cart/interactor/my_cart_repository.dart';
import 'package:ecommerce_concept/modules/my_cart/ui/screens/my_cart_screen_provider.dart';
import 'package:ecommerce_concept/modules/my_cart/ui/widgets/cart_title_widget.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/progress_indicator_widget.dart';
import '../../../../resources/app_colors.dart';
import '../widgets/bottom_menu_widget.dart';
import '../widgets/counter_button_widget.dart';
import '../widgets/image_widget.dart';
import '../widgets/phone_price_widget.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCartScreenProvider(
        repository: GetIt.I.get<MyCartRepository>(),
      ),
      child: Consumer<MyCartScreenProvider>(
        builder: (context, provider, _) => provider.isLoading
            ? const ProgressIndicatorWidget()
            : Scaffold(
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
                  rightIcon: Row(
                    children: [
                      Text(
                        'Add address',
                        style: AppStyles.text15w400.copyWith(
                          color: AppColors.stratosColor,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
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
                                  Icons.location_on_outlined,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CartTitleWidget(),
                      SizedBox(
                        height: 700,
                        width: double.maxFinite,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: ColoredBox(
                            color: AppColors.stratosColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 80,
                                left: 33,
                                right: 33,
                              ),
                              child: Column(
                                children: [
                                  ...provider.myCart?.basket!
                                          .map(
                                            (e) => Padding(
                                              padding: const EdgeInsets.only(bottom: 16),
                                              child: Row(
                                                children: [
                                                  ImageWidget(
                                                    image: e.images ?? 's',
                                                  ),
                                                  SizedBox(width: 16.w),
                                                  PhonePriceWidget(
                                                    title: e.title ?? '',
                                                    price: e.price ?? 0,
                                                  ),
                                                  const Spacer(),
                                                  CounterButtonWidget(
                                                    increment: () {
                                                      provider.increment(e.id!);
                                                    },
                                                    decrement: () {
                                                      provider.decrement(e.id!);
                                                    },
                                                    counter: provider.prodQuantity[e.id ?? 0] ?? 0,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList() ??
                                      [],
                                  SizedBox(height: 160.h),
                                  BottomMenuWidget(
                                    total: provider.myCart?.total ?? 0,
                                    delivery: provider.myCart?.delivery ?? '',
                                  )
                                ],
                              ),
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
