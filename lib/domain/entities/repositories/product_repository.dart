import 'package:flutter_clean_mvvm/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}
