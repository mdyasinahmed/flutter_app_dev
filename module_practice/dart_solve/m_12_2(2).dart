import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync()!.trim());
  
  List<int> arr = stdin.readLineSync()!.trim().split(' ').map(int.parse).toList();
  
  Set<int> gotNum = {};

  for (int num in arr) {
    if (gotNum.contains(num)) {
      print(num);
      return;
    }
    gotNum.add(num);
  }
}
