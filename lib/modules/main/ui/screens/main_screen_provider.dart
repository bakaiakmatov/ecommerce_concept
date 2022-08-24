import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/main/domain/products.dart';
import 'package:ecommerce_concept/modules/main/interactor/main_products_repository.dart';
import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  final MainProductsRepository _repository;
  MainScreenProvider({required MainProductsRepository repository}) : _repository = repository {
    fetchProducts();
  }

  Products? _products;
  Products? get products => _products;

  void fetchProducts() async {
    try {
      final response = await _repository.mainProductsRepository();
      _products = response;
    } on DioError catch (e) {
      debugPrint('$e');
    }
  }
}
