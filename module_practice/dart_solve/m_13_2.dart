import 'dart:io';

void main() {
  Map<int, int> prices = {
    101: 10,
    202: 25,
    303: 5,
  };

  List<int> inputs = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int productId = inputs[0];
  int quantity = inputs[1];

  int totalCost = prices[productId]! * quantity;

  print(totalCost);
}
