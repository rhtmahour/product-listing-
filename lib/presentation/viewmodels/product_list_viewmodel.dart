import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/domain/entities/product.dart';
import 'package:flutter_clean_mvvm/domain/entities/repositories/product_repository.dart';

enum ViewState { idle, busy, error }

class ProductListViewModel extends ChangeNotifier {
  final ProductRepository repository;

  ProductListViewModel({required this.repository});

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  List<Product> _products = [];
  List<Product> get products => List.unmodifiable(_products);

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> loadProducts() async {
    _state = ViewState.busy;
    notifyListeners();

    try {
      final result = await repository.fetchProducts();
      _products = result;
      _state = ViewState.idle;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
      notifyListeners();
    }
  }
}
