import 'package:class2_sum_app/home_screen.dart';
import 'package:flutter/material.dart';

class SumApp extends StatefulWidget {
  const SumApp({super.key});

  @override
  State<SumApp> createState() => _SumAppState();
}

class _SumAppState extends State<SumApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
