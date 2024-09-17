import 'package:flutter/material.dart';

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