import 'package:flutter/material.dart';
import 'package:lcp_13/screens/product_list_screen.dart';

class CrudApplication extends StatelessWidget {
  const CrudApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}
