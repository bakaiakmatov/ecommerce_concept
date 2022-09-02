import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/main/domain/main_products.dart';
import 'package:flutter/material.dart';

import '../../interactor/main_products_repository.dart';

class MainScreenProvider extends ChangeNotifier {
  final MainProductsRepository _repository;
  MainScreenProvider({required MainProductsRepository repository}) : _repository = repository {
    fetchProducts();
  }

  MainProducts? _products;
  MainProducts? get products => _products;

  void fetchProducts() async {
    try {
      _products = await _repository.mainProductsRepository();
      print(_products!.bestSeller.toString());
      print(_products!.homeStore.toString());

      notifyListeners();
    } on DioError catch (e) {
      debugPrint('fetchProducts $e');
    }
  }

  void onFavouritesChanged(int id) {
    final prod = _products!.bestSeller!.firstWhere((element) => element.id == id);

    _products!.bestSeller!.remove(prod);

    _products!.bestSeller!
      ..add(prod.copyWith(isFavorites: !(prod.isFavorites ?? false)))
      ..sort((a, b) => a.id!.compareTo(b.id!));
    notifyListeners();
  }

  final List<String> brand = [
    'Samsung',
    'Iphone',
    'Huawei',
  ];
  final List<String> price = [
    '300-500',
    '500-1000',
    '1000-5000',
  ];
  final List<String> size = [
    '150.9mm',
    '160.9mm',
  ];
}
