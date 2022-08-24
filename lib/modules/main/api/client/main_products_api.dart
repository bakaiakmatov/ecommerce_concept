import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/main/api/main_products_api_strings.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/products.dart';

part 'main_products_api.g.dart';

@RestApi()
abstract class MainProductsApi {
  factory MainProductsApi(Dio dio, {String baseUrl}) = _MainProductsApi;

  @GET(MainProductsApiStrings.getProducts)
  Future<Products> fetchMainProducts();
}
