import 'package:flutter/material.dart';
import '../models/item.dart';

class BagItemWidget extends StatelessWidget {
  final Item item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onOptionSelected;

  const BagItemWidget({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: onOptionSelected,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Color: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: item.color,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '   Size: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: item.size,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (item.quantity > 1) {
                                  onQuantityChanged(item.quantity - 1);
                                }
                              },
                            ),
                            Text(
                              item.quantity.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                onQuantityChanged(item.quantity + 1);
                              },
                            ),
                          ],
                        ),
                        Text(
                          '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
