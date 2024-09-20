import 'dart:convert';
import 'package:http/http.dart';

class UpdateProductService {
  Future<bool> updateProduct(String productId, Map<String, dynamic> requestBody) async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/$productId');

    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    // Check if the update was successful
    return response.statusCode == 200;
  }
}
