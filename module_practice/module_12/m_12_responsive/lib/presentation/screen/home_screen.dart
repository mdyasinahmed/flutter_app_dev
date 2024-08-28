import 'package:flutter/material.dart';
import 'package:m_12_responsive/presentation/widgets/responsive_builder.dart';

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
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text('Home'),
                tileColor: Colors.grey.shade200,
              ),
              ListTile(
                title: Text('Products'),
                tileColor: Colors.pink,
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
      body: ResponsiveBuilder(
        mobile: Center(
          child: Text('Hello world from Mobile'),
        ),
        tablet: Center(
          child: Text('Hello world from Tablet'),
        ),
        desktop: Center(
          child: Text('Another Message'),
        ),
      ),
    );
  }
}