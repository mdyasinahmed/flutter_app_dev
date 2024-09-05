import 'package:flutter/material.dart';
import '../models/item.dart';

class ColorSizeDialog extends StatefulWidget {
  final Item item;
  final ValueChanged<Item> onItemUpdated;

  const ColorSizeDialog({
    Key? key,
    required this.item,
    required this.onItemUpdated,
  }) : super(key: key);

  @override
  _ColorSizeDialogState createState() => _ColorSizeDialogState();
}

class _ColorSizeDialogState extends State<ColorSizeDialog> {
  late String selectedColor;
  late String selectedSize;

  final List<String> availableColors = ['Black', 'White', 'Blue', 'Green', 'Pink'];
  final List<String> availableSizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  @override
  void initState() {
    super.initState();
    selectedColor = widget.item.color;
    selectedSize = widget.item.size;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Color & Size'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: selectedColor,
            decoration: InputDecoration(labelText: 'Color'),
            items: availableColors
                .map((color) => DropdownMenuItem(
              value: color,
              child: Text(color),
            ))
                .toList(),
            onChanged: (newColor) {
              if (newColor != null) {
                setState(() {
                  selectedColor = newColor;
                });
              }
            },
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: selectedSize,
            decoration: InputDecoration(labelText: 'Size'),
            items: availableSizes
                .map((size) => DropdownMenuItem(
              value: size,
              child: Text(size),
            ))
                .toList(),
            onChanged: (newSize) {
              if (newSize != null) {
                setState(() {
                  selectedSize = newSize;
                });
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Cancel and close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Update the item with selected options
            Item updatedItem = Item(
              name: widget.item.name,
              price: widget.item.price,
              quantity: widget.item.quantity,
              color: selectedColor,
              size: selectedSize,
              imagePath: widget.item.imagePath,
            );
            widget.onItemUpdated(updatedItem);
            Navigator.of(context).pop();
          },
          child: Text('OK'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
