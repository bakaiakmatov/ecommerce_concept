import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/my_cart/domain/my_cart_model.dart';
import 'package:ecommerce_concept/modules/my_cart/interactor/my_cart_repository.dart';
import 'package:flutter/cupertino.dart';

class MyCartScreenProvider extends ChangeNotifier {
  final MyCartRepository _repository;

  MyCartScreenProvider({required MyCartRepository repository}) : _repository = repository {
    fetchMyCart();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    if (val != _isLoading) {
      _isLoading = val;
      notifyListeners();
    }
  }

  MyCart? _myCart;
  MyCart? get myCart => _myCart;

  void fetchMyCart() async {
    isLoading = true;
    try {
      _myCart = await _repository.myCartRepository();
      debugPrint(_myCart.toString());
      notifyListeners();
    } on DioError catch (e) {
      debugPrint('fetchMyCart $e');
    } finally {
      isLoading = false;
    }
  }

  final Map<int, int> _prodQuantity = {};

  Map<int, int> get prodQuantity => _prodQuantity;

  void increment(int id) {
    _prodQuantity[id] = (_prodQuantity[id] ?? 0) + 1;
    notifyListeners();
  }

  void decrement(int id) {
    final count = _prodQuantity[id] ?? 0;
    if (count > 0) {
      _prodQuantity[id] = count - 1;
      notifyListeners();
    }
  }
}
