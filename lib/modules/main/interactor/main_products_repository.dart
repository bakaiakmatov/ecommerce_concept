import 'package:ecommerce_concept/modules/main/api/client/main_products_api.dart';
import 'package:ecommerce_concept/modules/main/domain/main_products.dart';

class MainProductsRepository {
  final MainProductsApi _client;
  MainProductsRepository({required MainProductsApi client}) : _client = client;

  Future<MainProducts> mainProductsRepository() => _client.fetchMainProducts();
}
