import 'package:ecommerce_concept/modules/app_state/app_component.dart';
import 'package:ecommerce_concept/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'resources/app_themes.dart';

void main() async {
  await AppComponents().init();
  runApp(
    const MyApp(),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce concept',
          theme: mainTheme(),
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
