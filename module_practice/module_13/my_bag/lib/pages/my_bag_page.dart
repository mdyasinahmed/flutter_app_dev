import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/bag_item_widget.dart';
import '../widgets/color_size_dialog.dart';

class MyBagPage extends StatefulWidget {
  @override
  _MyBagPageState createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  final List<Item> items = [
    Item(
      name: 'T-Shirt',
      price: 9.99,
      quantity: 1,
      color: 'Black',
      size: 'L',
      imagePath: 'assets/t_shirt.webp',
    ),
    Item(
      name: 'Drop Shoulder',
      price: 14.99,
      quantity: 1,
      color: 'White',
      size: 'M',
      imagePath: 'assets/drop_shoulder.webp',
    ),
    Item(
      name: 'Sports Dress',
      price: 24.99,
      quantity: 1,
      color: 'Blue',
      size: 'S',
      imagePath: 'assets/sports_dress.webp',
    ),
  ];

  double get totalPrice {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void _updateItem(int index, Item updatedItem) {
    setState(() {
      items[index] = updatedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return BagItemWidget(
                    item: items[index],
                    onQuantityChanged: (newQuantity) {
                      setState(() {
                        items[index].quantity = newQuantity;
                      });
                    },
                    onOptionSelected: () {
                      showDialog(
                        context: context,
                        builder: (context) => ColorSizeDialog(
                          item: items[index],
                          onItemUpdated: (updatedItem) {
                            _updateItem(index, updatedItem);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Divider(thickness: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Displaying the Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Successfully Added to the Order! \nConfirm Your Order NOW!.'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'CHECK OUT',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
