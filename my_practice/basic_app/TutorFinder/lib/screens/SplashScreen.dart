import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Automatically navigate to the login page after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      navigateToLoginPage();
    });
  }

  void navigateToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToLoginPage, // Navigate when the screen is tapped
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF547EFF), Color(0xFF89A9FF)], // Gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(
                'assets/app_logo.png', // Path to your app logo
                width: 150, // Adjust as needed
                height: 150, // Adjust as needed
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/company_and_copyright.png',
                  width: 100, // Adjust as needed
                  height: 50, // Adjust as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF547EFF),
      ),
      body: Center(
        child: Text(
          'Login Page',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
