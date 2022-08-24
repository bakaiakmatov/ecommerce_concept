import 'package:flutter/material.dart';
import '../modules/main/ui/screens/main_screen.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const MainScreen(),
    // OnBoardScreen.routeName: (context) => const OnBoardScreen(),
    // MainScreen.routeName: (context) => const MainScreen(),
  };
}
