import 'package:ecommerce_concept/modules/main/ui/res/category_card_res.dart';
import 'package:ecommerce_concept/modules/main/ui/widgets/category_card_widget.dart';
import 'package:ecommerce_concept/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CategriesWidget extends StatefulWidget {
  final List<CategoryCardRes> list;
  final ValueChanged<CategoryCardRes>? onChanged;
  const CategriesWidget({Key? key, required this.list, this.onChanged}) : super(key: key);

  @override
  State<CategriesWidget> createState() => _CategriesWidgetState();
}

class _CategriesWidgetState extends State<CategriesWidget> {
  late CategoryCardRes selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.list
            .map(
              ((e) => CategoryCardWidget(
                    icon: e.icon,
                    text: e.text,
                    color: selectedCategory == e ? AppColors.persimmonColor : AppColors.whiteColor,
                    onTap: () {
                      setState(() {
                        selectedCategory = e;
                        widget.onChanged?.call(selectedCategory);
                      });
                    },
                  )),
            )
            .toList(),
      ),
    );
  }
}
