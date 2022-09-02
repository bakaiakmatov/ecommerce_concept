import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_colors.dart';

class SliderWidget extends StatefulWidget {
  final List<String> images;
  const SliderWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final PageController controller = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: widget.images.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Align(
        alignment: Alignment.center,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: AppColors.stratosColor.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 16,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            child: CachedNetworkImage(
              height: 316.h,
              // width: 300,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
              imageUrl: widget.images[index],
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
        ),
      ),
    );
  }
}
