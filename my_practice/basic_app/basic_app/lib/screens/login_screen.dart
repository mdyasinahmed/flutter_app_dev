import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeScreen())),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignupScreen())),
              child: Text('Don’t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
