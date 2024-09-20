class Product {
  final String id;
  final String productName;
  final String unitPrice;
  final String totalPrice;
  final String productImage;
  final String productCode;
  final String quantity;

  Product({
    required this.id,
    required this.productName,
    required this.unitPrice,
    required this.totalPrice,
    required this.productImage,
    required this.productCode,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      productName: json['ProductName'] ?? 'Unknown',
      unitPrice: json['UnitPrice'] ?? '0',
      totalPrice: json['TotalPrice'] ?? '0',
      productImage: json['Img'] ?? '',
      productCode: json['ProductCode'] ?? 'N/A',
      quantity: json['Qty'] ?? '0',
    );
  }
}
