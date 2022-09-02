import 'package:ecommerce_concept/modules/product_details/api/client/product_details_api.dart';
import 'package:ecommerce_concept/modules/product_details/domain/product_details.dart';

class ProductDetailsRepository {
  final ProductDetailsApi _client;
  ProductDetailsRepository({required ProductDetailsApi client}) : _client = client;

  Future<ProductDetails> productDetailsRepository() => _client.fetchProductDetails();
}
