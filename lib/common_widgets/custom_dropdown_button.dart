import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? hintText;
  final FormFieldValidator<T>? validator;
  const CustomDropdownButton({
    Key? key,
    this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.h,
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          filled: true,
          fillColor: AppColors.whiteColor,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grayColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grayColor,
            ),
          ),
        ),
        value: value,
        items: items,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
