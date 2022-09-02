import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_styles.dart';

class TabBarWidget extends StatelessWidget {
  final Widget widget;
  const TabBarWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: AppColors.whiteColor,
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.only(bottom: 16),
                labelStyle: AppStyles.text18w500,
                labelColor: AppColors.stratosColor,
                tabs: const [
                  Tab(text: 'Shop'),
                  Tab(text: 'Details'),
                  Tab(text: 'Features'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    widget,
                    const Center(child: Text('Details')),
                    const Center(child: Text('Features')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
