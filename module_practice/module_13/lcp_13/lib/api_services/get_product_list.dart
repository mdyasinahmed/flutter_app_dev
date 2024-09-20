import 'dart:convert';
import 'package:http/http.dart';
import '/models/product.dart';

class GetProductListService {
  Future<List<Product>> fetchProductList() async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);

    if (response.statusCode == 200) {
      List<Product> productList = [];
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product.fromJson(item);
        productList.add(product);
      }
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
