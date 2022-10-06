import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class CartTitleWidget extends StatelessWidget {
  const CartTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 42,
        right: 42,
        top: 50,
        bottom: 50,
      ),
      child: Text(
        'My Cart',
        style: AppStyles.text35w700.copyWith(
          color: AppColors.stratosColor,
        ),
      ),
    );
  }
}
