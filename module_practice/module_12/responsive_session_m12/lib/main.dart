import 'package:flutter/material.dart';
import 'package:responsive_session_m12/screens/home_screen.dart';

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