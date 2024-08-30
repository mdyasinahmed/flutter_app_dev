import 'dart:io';

void main() {
  List<int> inputs = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  

  int wheels = inputs[0];
  int carBodies = inputs[1];
  int figures = inputs[2];
  
  
  int maxCars = min(wheels ~/ 4, min(carBodies, figures ~/ 2));
  
  print(maxCars);
}

int min(int a, int b) {
  return (a < b) ? a : b;
}
