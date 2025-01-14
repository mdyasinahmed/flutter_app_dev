import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/bottom_nav_bar.dart';

class TutorHomeScreen extends StatefulWidget {
  @override
  _TutorHomeScreenState createState() => _TutorHomeScreenState();
}

class _TutorHomeScreenState extends State<TutorHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Notifications Page')),
    Center(child: Text('Posts Page')),
    Center(child: Text('Find Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      endDrawer: ProfileDrawer(
        username: "John Doe",
        contactNumber: "+123456789",
        presentAddress: "123 Street, City",
        permanentAddress: "456 Avenue, City",
        profileDescription: "Passionate about teaching.",
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Find'),
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
