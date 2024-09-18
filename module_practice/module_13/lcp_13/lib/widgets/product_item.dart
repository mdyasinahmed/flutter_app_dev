import 'package:flutter/material.dart';
import 'package:lcp_13/models/product.dart';
import 'package:lcp_13/screens/update_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Colors.white,
        title: Text(product.productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Code: ${product.productCode}'),
            Text('Price: \$${product.unitPrice}'),
            Text('Quantity: ${product.quantity}'),
            Text('Total Price: \$${product.totalPrice}'),
            Divider(),
            ButtonBar(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const UpdateNewProductScreen();
                      }),
                    );
                  },
                  icon: Icon(Icons.edit),
                  label: const Text('Edit'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}