import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: AppColors.persimmonColor,
      )),
    );
  }
}
