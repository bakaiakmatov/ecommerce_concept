import 'dart:async';

import 'package:ecommerce_concept/modules/main/ui/screens/main_screen.dart';
import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:ecommerce_concept/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
          (_) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.stratosColor,
      child: LogoWidget(),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 132.h,
            width: 132.w,
            decoration: BoxDecoration(
              color: AppColors.persimmonColor,
              borderRadius: BorderRadius.circular(500),
            ),
          ),
          Align(
            alignment: const Alignment(0.4, 0),
            child: Material(
              color: Colors.transparent,
              child: Text(
                'Ecommerce\nConcept',
                style: AppStyles.text30w800.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
