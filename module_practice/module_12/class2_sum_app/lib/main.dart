import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const RSSApp());
}

class RSSApp extends StatelessWidget{
  const RSSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}