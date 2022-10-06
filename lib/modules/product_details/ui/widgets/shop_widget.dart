import 'package:ecommerce_concept/common_widgets/custom_button_widget.dart';
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
  late String selectedMemory;
  late String selectedColorIcon;

  @override
  void initState() {
    selectedColorIcon = widget.color.first;
    selectedMemory = widget.capacity.first;
    debugPrint('=> ${widget.color.first}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('selectedColorIcon => $selectedColorIcon');

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
            ...widget.color
                .map(
                  (color) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColorIcon = color;
                        });
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 39,
                            width: 39,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(int.parse('0xFF' + color.substring(1))),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(65),
                                ),
                              ),
                            ),
                          ),
                          selectedColorIcon == color
                              ? const Positioned(
                                  top: 4,
                                  left: 4,
                                  child: Icon(
                                    Icons.check_sharp,
                                    color: AppColors.whiteColor,
                                    size: 28,
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            SizedBox(width: 60.w),
            ...widget.capacity
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMemory = e;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        height: 28.h,
                        width: 68.w,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: selectedMemory == e ? AppColors.persimmonColor : AppColors.whiteColor,
                          ),
                          child: Center(
                            child: Text(
                              e,
                              style: AppStyles.text13w700.copyWith(
                                color: selectedMemory == e ? AppColors.whiteColor : AppColors.grayColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
        SizedBox(height: 26.h),
        CustomButtonWidget(
          price: widget.price,
          title: 'Add to Cart',
        )
      ],
    );
  }
}
