import 'package:ecommerce_concept/modules/my_cart/ui/screens/my_cart_screen.dart';
import 'package:ecommerce_concept/modules/product_details/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../modules/main/ui/screens/main_screen.dart';
import '../modules/splash/splash_screen.dart';

class AppRoutes {
  static const mainScreen = '/MainScreen';
  static const productDetailsScreen = '/ProductDetailsScreen';
  static const myCartScreen = '/MyCartScreen';

  static final Map<String, Widget Function(Object?)> routes = {
    '/': (_) => const SplashScreen(),
    mainScreen: (data) => const MainScreen(),
    productDetailsScreen: (data) => const ProductDetailsScreen(),
    myCartScreen: (data) => const MyCartScreen(),
  };
}
