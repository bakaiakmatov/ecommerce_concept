import 'package:ecommerce_concept/modules/main/api/client/main_products_api.dart';
import 'package:ecommerce_concept/modules/main/domain/products.dart';

class MainProductsRepository {
  MainProductsApi _client;
  MainProductsRepository({required MainProductsApi client}) : _client = client;

  Future<Products> mainProductsRepository() => _client.fetchMainProducts();
}
