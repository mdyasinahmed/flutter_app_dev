import 'package:flutter/material.dart';

class GuardianModeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guardian Mode Home'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Welcome to Guardian Mode!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
