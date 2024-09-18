import 'package:flutter/material.dart';

class UpdateNewProductScreen extends StatefulWidget {
  const UpdateNewProductScreen({super.key});

  @override
  State<UpdateNewProductScreen> createState() => _UpdateNewProductScreenState();
}

class _UpdateNewProductScreenState extends State<UpdateNewProductScreen> {
  final TextEditingController _productNameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _productImageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildNewProductForm(),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
              hintText: 'Product Name',
              labelText: 'Product Name',
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(
              hintText: 'Unit Price',
              labelText: 'Unit Price',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _productImageTEController,
            decoration: const InputDecoration(
              hintText: 'Image',
              labelText: 'Product Image',
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(
              hintText: 'Product Code',
              labelText: 'Product Code',
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Quantity',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            onPressed: _onTapAddProductButton,
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }


  void _onTapAddProductButton() {

  }


  @override
  void dispose() {
    _productNameTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _productImageTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();

    super.dispose();
  }
}
