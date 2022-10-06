import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/main/interactor/main_products_repository.dart';
import 'package:ecommerce_concept/modules/my_cart/api/client/my_cart_api.dart';
import 'package:ecommerce_concept/modules/my_cart/interactor/my_cart_repository.dart';
import 'package:ecommerce_concept/modules/product_details/api/client/product_details_api.dart';
import 'package:ecommerce_concept/modules/product_details/interactor/product_details_repository.dart';
import 'package:get_it/get_it.dart';

import '../main/api/client/main_products_api.dart';

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
    GetIt.instance.registerSingleton<MainProductsRepository>(
      MainProductsRepository(
        client: MainProductsApi(_dio),
      ),
    );
    GetIt.instance.registerSingleton<ProductDetailsRepository>(
      ProductDetailsRepository(
        client: ProductDetailsApi(
          (_dio),
        ),
      ),
    );
    GetIt.instance.registerSingleton<MyCartRepository>(
      MyCartRepository(
        client: MyCartApi(_dio),
      ),
    );
  }
}
