// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
            return const ProductItem();
          },
            separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
            },
        ),
      )
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: const Text('Product Name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Code: CODE'),
          const Text('Price: \$120'),
          const Text('Quantity: 2'),
          const Text('Total Price: \$240'),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.delete_outline),
                label: const Text('Delete'),
              ),
            ],
          )
        ],
      )
    );
  }
}
