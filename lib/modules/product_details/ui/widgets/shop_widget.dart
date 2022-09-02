import 'package:ecommerce_concept/modules/product_details/ui/widgets/row_characteristic_widget.dart';
import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopWidget extends StatefulWidget {
  final List<String> color;
  final List<String> capacity;
  final int price;
  final String cpu;
  final String camera;
  final String ssd;
  final String sd;
  const ShopWidget(
      {Key? key,
      required this.color,
      required this.capacity,
      required this.price,
      required this.cpu,
      required this.camera,
      required this.ssd,
      required this.sd})
      : super(key: key);

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  String? selectedColor;
  String? selectedMemory;

  // @override
  // void initState() {
  //   selectedColor == widget.color.first;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowCharacteristic(
          cpu: widget.cpu,
          camera: widget.camera,
          ssd: widget.ssd,
          sd: widget.sd,
        ),
        SizedBox(height: 26.h),
        Text(
          'Select color and capacity',
          style: AppStyles.text16w700.copyWith(
            color: AppColors.stratosColor,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Row(
              children: widget.color
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = e;
                            selectedMemory = e;
                          });
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 39,
                              width: 39,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(int.parse('0xFF' + e.substring(1))),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(65),
                                  ),
                                ),
                              ),
                            ),
                            if (selectedColor == e)
                              const Icon(
                                Icons.check_sharp,
                                color: AppColors.whiteColor,
                                size: 28,
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(width: 60.w),
            Row(
              children: widget.capacity
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        height: 28.h,
                        width: 68.w,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: AppColors.persimmonColor),
                          child: Center(
                            child: Text(e, style: AppStyles.text13w700.copyWith(color: AppColors.whiteColor)),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
        SizedBox(height: 26.h),
        SizedBox(
          height: 58.h,
          width: double.maxFinite,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.persimmonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add to Cart',
                    style: AppStyles.text20w700.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    '${widget.price}',
                    style: AppStyles.text20w700.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
