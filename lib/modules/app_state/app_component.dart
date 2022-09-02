import 'package:ecommerce_concept/modules/my_cart/api/client/my_cart_api.dart';
import 'package:ecommerce_concept/modules/product_details/api/client/product_details_api.dart';
import 'package:get_it/get_it.dart';
import '../main/api/client/main_products_api.dart';
import 'package:dio/dio.dart';

class AppComponents {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://run.mocky.io/',
      connectTimeout: 10000,
      followRedirects: false,
      validateStatus: (status) => status! < 500,
      receiveTimeout: 10000,
    ),
  );
  Future<void> init() async {
    GetIt.instance.registerSingleton<MainProductsApi>(MainProductsApi(_dio));
    GetIt.instance.registerSingleton<ProductDetailsApi>(ProductDetailsApi(_dio));
    GetIt.instance.registerSingleton<MyCartApi>(MyCartApi(_dio));
  }
}
