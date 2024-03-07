import 'dart:convert';
import 'package:http/http.dart' as http;

import 'product.dart';

class ProductAPI {
  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)['products'];
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
