import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/product_details/api/product_details_api_strings.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/product_details.dart';

part 'product_details_api.g.dart';

@RestApi()
abstract class ProductDetailsApi {
  factory ProductDetailsApi(Dio dio, {String baseUrl}) = _ProductDetailsApi;

  @GET(ProductDetailsApiString.productDetailsApi)
  Future<ProductDetails> fetchProductDetails();
}
