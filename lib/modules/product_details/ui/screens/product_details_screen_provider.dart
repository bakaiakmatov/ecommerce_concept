import 'package:dio/dio.dart';
import 'package:ecommerce_concept/modules/product_details/interactor/product_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../domain/product_details.dart';

class ProductDetailsScreenProvider extends ChangeNotifier {
  final ProductDetailsRepository _repository;
  ProductDetailsScreenProvider({required ProductDetailsRepository repository}) : _repository = repository {
    fetchProductDetails();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    if (val != _isLoading) {
      _isLoading = val;
      notifyListeners();
    }
  }

  ProductDetails? _productDetails;
  ProductDetails? get productDetails => _productDetails;

  void fetchProductDetails() async {
    isLoading = true;
    try {
       _productDetails = await _repository.productDetailsRepository();
      debugPrint('ТУТ => ${_productDetails!.toJson()}');
      notifyListeners();
    } on DioError catch (e) {
      debugPrint('fetchProductDetails $e');
    } finally {
      isLoading = false;
    }
  }
}
