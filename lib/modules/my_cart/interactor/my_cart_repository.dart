import 'package:ecommerce_concept/modules/my_cart/api/client/my_cart_api.dart';
import 'package:ecommerce_concept/modules/my_cart/domain/my_cart_model.dart';

class MyCartRepository {
  final MyCartApi _client;
  MyCartRepository({required MyCartApi client}) : _client = client;

  Future<MyCart> myCartRepository() => _client.fetchMyCart();
}
