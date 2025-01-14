import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/bottom_nav_bar.dart';

class GuardianHomeScreen extends StatefulWidget {
  @override
  _GuardianHomeScreenState createState() => _GuardianHomeScreenState();
}

class _GuardianHomeScreenState extends State<GuardianHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Notifications Page')),
    Center(child: Text('Create Page')),
    Center(child: Text('Search Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      endDrawer: ProfileDrawer(
        username: "Jane Smith",
        contactNumber: "+987654321",
        presentAddress: "789 Boulevard, City",
        permanentAddress: "101 Highway, City",
        profileDescription: "Looking for the best tutors.",
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
