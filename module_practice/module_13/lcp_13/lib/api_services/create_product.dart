import 'dart:convert';
import 'package:http/http.dart';

class CreateProductService {
  Future<bool> createProduct(Map<String, dynamic> requestBody) async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');

    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    // Check if the product creation was successful
    return response.statusCode == 200;
  }
}
