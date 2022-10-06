import 'package:flutter/material.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String viewText;
  const TitleWidget({
    Key? key,
    required this.title,
    required this.viewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.text25w700.copyWith(
              color: AppColors.stratosColor,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              viewText,
              style: AppStyles.text15w400.copyWith(
                color: AppColors.persimmonColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
