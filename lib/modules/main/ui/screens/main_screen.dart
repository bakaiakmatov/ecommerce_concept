import 'package:ecommerce_concept/modules/main/api/client/main_products_api.dart';
import 'package:ecommerce_concept/modules/main/interactor/main_products_repository.dart';
import 'package:ecommerce_concept/modules/main/ui/res/category_card_res.dart';
import 'package:ecommerce_concept/modules/main/ui/screens/main_screen_provider.dart';
import 'package:ecommerce_concept/modules/main/ui/widgets/carousel_slider_widget.dart';
import 'package:ecommerce_concept/modules/main/ui/widgets/category_card_widget.dart';
import 'package:ecommerce_concept/modules/main/ui/widgets/product_card_widget.dart';
import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/custom_bottom_sheet.dart';
import '../../../../resources/app_icons.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/search_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainScreenProvider(
        repository: MainProductsRepository(
          client: GetIt.I.get<MainProductsApi>(),
        ),
      ),
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: CustomAppbar(
            title: Row(
              children: [
                SvgPicture.asset(AppIconPaths.location),
                SizedBox(width: ScreenUtil().setWidth(8)),
                Text(
                  'Zihuatanejo, Gro',
                  style: AppStyles.text15w400.copyWith(color: AppColors.stratosColor),
                ),
              ],
            ),
            rightIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashRadius: 22,
              icon: SvgPicture.asset(AppIconPaths.filter),
              onPressed: () {
                print('Show Bottom Sheet');
                showCustomBottomSheet(context, const BottomSheetWidget());
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Category',
                        style: AppStyles.text25w700.copyWith(
                          color: AppColors.stratosColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'view all',
                          style: AppStyles.text15w400.copyWith(
                            color: AppColors.persimmonColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: CategoryCardRes.categoryList
                        .map(
                          ((e) => CategoryCardWidget(
                                icon: e.icon,
                                text: e.text,
                              )),
                        )
                        .toList(),
                  ),
                ),
                const SearchWidget(),
                SizedBox(
                  height: 24.h,
                ),
                const CarouselSliderWidget(),
                SizedBox(
                  height: 8.h,
                ),
                const ProductCardWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
