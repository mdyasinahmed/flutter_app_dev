import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue,
    title: Text(
      'TutorFinder',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    actions: [
      Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Open the end drawer
              Scaffold.of(context).openEndDrawer();
            },
          );
        },
      ),
    ],
  );
}
