import 'dart:convert';
import 'package:flutter_clean_mvvm/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> fetchProducts() async {
    // For demo, use a placeholder API. Replace with your API.
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> list = json.decode(response.body) as List<dynamic>;
      return list
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
