import 'package:flutter/material.dart';
import '/models/product.dart';
import '/screens/add_new_product_screen.dart';
import '/screens/update_product_screen.dart';
import '/widgets/product_item.dart';
import '/api_services/delete_product.dart';
import '/api_services/get_product_list.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    _fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
        actions: [
          IconButton(
            onPressed: () {
              _fetchProductList();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: _inProgress
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
              onEdit: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProductScreen(
                    product: productList[index],
                  ),
                ),
              ).then((value) {
                _fetchProductList(); // Refresh after returning from update screen
              }),
              onDelete: () => _confirmDelete(productList[index].id),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const AddNewProductScreen();
            }),
          ).then((value) {
            _fetchProductList(); // Refresh after returning from add screen
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _fetchProductList() async {
    setState(() {
      _inProgress = true;
    });

    final getProductListService = GetProductListService();
    try {
      productList = await getProductListService.fetchProductList();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load product list')),
      );
    }

    setState(() {
      _inProgress = false;
    });
  }

  Future<void> _confirmDelete(String productId) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final deleteProductService = DeleteProduct();
      final success = await deleteProductService.deleteProductById(productId);

      if (success) {
        _fetchProductList(); // Refresh product list
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product deleted successfully'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product deletion failed'),
          ),
        );
      }
    }
  }
}
