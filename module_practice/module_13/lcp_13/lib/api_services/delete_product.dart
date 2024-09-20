import 'dart:convert';
import 'package:http/http.dart';

class DeleteProduct {
  Future<bool> deleteProductById(String productId) async {
    final uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$productId');
    Response response = await get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
