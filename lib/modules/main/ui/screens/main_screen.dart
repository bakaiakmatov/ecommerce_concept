import 'package:ecommerce_concept/modules/main/ui/res/category_card_res.dart';
import 'package:ecommerce_concept/modules/main/ui/screens/main_screen_provider.dart';
import 'package:ecommerce_concept/modules/main/ui/widgets/bottom_navigation_bar.dart';
import 'package:ecommerce_concept/modules/main/ui/widgets/carousel_slider_widget.dart';
import 'package:ecommerce_concept/modules/main/ui/widgets/categories_widget.dart';
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
import '../../../../common_widgets/progress_indicator_widget.dart';
import '../../../../resources/app_icons.dart';
import '../../interactor/main_products_repository.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/title_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainScreenProvider(
        repository: GetIt.I.get<MainProductsRepository>(),
      ),
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, _) => provider.isLoading
            ? const ProgressIndicatorWidget()
            : Scaffold(
                appBar: CustomAppbar(
                  title: Row(
                    children: [
                      SvgPicture.asset(AppIconPaths.location),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      Text(
                        'Zihuatanejo, Gro',
                        style: AppStyles.text15w400.copyWith(color: AppColors.stratosColor),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.grayColor,
                      )
                    ],
                  ),
                  rightIcon: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 22,
                    icon: SvgPicture.asset(AppIconPaths.filter),
                    onPressed: () {
                      debugPrint('Show Bottom Sheet');
                      showCustomBottomSheet(
                        context,
                        BottomSheetWidget(
                          brand: provider.brand,
                          price: provider.price,
                          size: provider.size,
                        ),
                      );
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(
                        title: 'Select Category',
                        viewText: 'view all',
                      ),
                      SizedBox(height: 18.h),
                      CategriesWidget(
                        list: CategoryCardRes.categoryList,
                        onChanged: (category) {},
                      ),
                      const SearchWidget(),
                      SizedBox(height: 16.h),
                      CarouselSliderWidget(info: provider.products?.homeStore ?? []),
                      SizedBox(height: 8.h),
                      ProductCardWidget(
                        bestSeller: provider.products?.bestSeller ?? [],
                        onFavouritesChanged: provider.onFavouritesChanged,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: const BottomNavigationBarWidget(),
              ),
      ),
    );
  }
}
