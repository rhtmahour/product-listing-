import 'package:flutter_clean_mvvm/data/models/sources/product_remote_data_source.dart';
import 'package:flutter_clean_mvvm/domain/entities/product.dart';
import 'package:flutter_clean_mvvm/domain/entities/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> fetchProducts() async {
    // Here you can add caching, mapping, error handling
    final models = await remoteDataSource.fetchProducts();
    // models are already Product (ProductModel extends Product)
    return models;
  }
}
