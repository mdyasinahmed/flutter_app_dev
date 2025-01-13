import 'package:flutter/material.dart';
import 'package:tutor_finder/screens/SplashScreen.dart';

void main() {
  runApp(TutorFinderApp());
}

class TutorFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutor Finder',
      home: SplashScreen(),
    );
  }
}
