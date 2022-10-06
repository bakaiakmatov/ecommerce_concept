import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/app_colors.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  const ImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: 80.h,
        width: 80.w,
        imageUrl: image,
        errorWidget: (context, url, error) => const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: AppColors.stratosColor,
          ),
        ),
        colorBlendMode: BlendMode.xor,
      ),
    );
  }
}
