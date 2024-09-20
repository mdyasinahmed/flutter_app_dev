import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lcp_13/models/product.dart';
import '../screens/product_list_screen.dart';
class ProductListScreen extends StatefulWidget {
}

class _ProductListScreenState extends State<ProductListScreen> {
List<Product> productList = [];
bool _inProgress = false;

@override
void initState() {
super.initState();
getProductList();
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Product list'),
actions: [
IconButton(onPressed: () {
getProductList();
}, icon: const Icon(Icons.refresh))
],
),
body: Padding(
body: _inProgress ? const Center(
child: CircularProgressIndicator(),
) : Padding(
padding: const EdgeInsets.symmetric(horizontal: 16.0),
child: ListView.separated(
itemCount: 20,
itemCount: productList.length,
itemBuilder: (context, index) {
return const ProductItem();
return ProductItem(
product: productList[index],
);
},
separatorBuilder: (context, index) {
return const SizedBox(height: 16);
class _ProductListScreenState extends State<ProductListScreen> {
),
);
}

Future<void> getProductList() async {
_inProgress = true;
setState(() {});
print('Requesting');
Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
Response response = await get(uri);
print(response);
print(response.statusCode);
print(response.body);

if (response.statusCode == 200) {
productList.clear();
Map<String, dynamic> jsonResponse = jsonDecode(response.body);
for (var item in jsonResponse['data']) {
Product product = Product(id: item['_id'],
productName: item['ProductName'] ?? '',
productCode: item['ProductCode'] ?? '',
productImage: item['Img'] ?? '',
unitPrice: item['UnitPrice'] ?? '',
quantity: item['Qty'] ?? '',
totalPrice: item['TotalPrice'] ?? '',
createdAt: item['CreatedDate'] ?? '',
);
productList.add(product);
}
}

_inProgress = false;
setState(() {});
}
}