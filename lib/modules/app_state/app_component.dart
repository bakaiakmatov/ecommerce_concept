import 'package:dio/dio.dart';
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
    // GetIt.instance.registerSingleton<Dio>(_dio);
    GetIt.instance.registerSingleton<MainProductsApi>(MainProductsApi(_dio));
  }
}
