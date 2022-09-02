import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/my_cart/api/my_cart_api_string.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/my_cart_model.dart';

part 'my_cart_api.g.dart';

@RestApi()
abstract class MyCartApi {
  factory MyCartApi(Dio dio, {String baseUrl}) = _MyCartApi;

  @GET(MyCartApiString.myCartApi)
  Future<MyCart> fetchMyCart();
}
