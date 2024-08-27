import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text('Home'),
              ),
              ListTile(
                title: Text('Products'),
              ),
              ListTile(
                title: Text('Stocks'),
              ),
              ListTile(
                title: Text('Bills'),
              ),
              ListTile(
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('home'),
      ),
    );
  }
}
