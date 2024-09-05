import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBagPage(),
    );
  }
}

class MyBagPage extends StatefulWidget {
  @override
  _MyBagPageState createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'T-Shirt',
      'price': 9.99,
      'quantity': 1,
      'color': 'Black',
      'size': 'L',
      'imagePath': 'assets/t_shirt.webp'
    },
    {
      'name': 'Drop Shoulder',
      'price': 14.99,
      'quantity': 1,
      'color': 'White',
      'size': 'M',
      'imagePath': 'assets/drop_shoulder.webp'
    },
    {
      'name': 'Sports Dress',
      'price': 24.99,
      'quantity': 1,
      'color': 'Blue',
      'size': 'S',
      'imagePath': 'assets/sports_dress.webp'
    }
  ];

  double get totalPrice {
    double total = 0.0;
    for (var item in items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Bag',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
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
                                image: AssetImage(items[index]['imagePath']),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index]['name'],
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => _showColorSizeDialog(context, index),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Color: ',
                                                      style: TextStyle(color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: items[index]['color'],
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
                                                      text: items[index]['size'],
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
                                              setState(() {
                                                if (items[index]['quantity'] > 1) {
                                                  items[index]['quantity']--;
                                                }
                                              });
                                            },
                                          ),
                                          Text(items[index]['quantity'].toString()),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                items[index]['quantity']++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$${(items[index]['price'] * items[index]['quantity']).toStringAsFixed(2)}',
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
              onPressed: () {},
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

  void _showColorSizeDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedColor = items[index]['color'];
        String selectedSize = items[index]['size'];
        return AlertDialog(
          title: Text('Select Color & Size'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: selectedColor,
                items: ['Black', 'White', 'Blue', 'Green', 'Pink']
                    .map((color) => DropdownMenuItem(
                  value: color,
                  child: Text(color),
                ))
                    .toList(),
                onChanged: (newColor) {
                  setState(() {
                    items[index]['color'] = newColor!;
                  });
                  Navigator.pop(context);
                },
              ),
              DropdownButton<String>(
                value: selectedSize,
                items: ['S', 'M', 'L', 'XL', 'XXL', 'XXXL']
                    .map((size) => DropdownMenuItem(
                  value: size,
                  child: Text(size),
                ))
                    .toList(),
                onChanged: (newSize) {
                  setState(() {
                    items[index]['size'] = newSize!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
