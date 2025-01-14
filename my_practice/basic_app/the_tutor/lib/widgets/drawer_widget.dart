import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  final String username;
  final String contactNumber;
  final String presentAddress;
  final String permanentAddress;
  final String profileDescription;

  const ProfileDrawer({
    required this.username,
    required this.contactNumber,
    required this.presentAddress,
    required this.permanentAddress,
    required this.profileDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: Text(contactNumber),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 50),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Present Address"),
            subtitle: Text(presentAddress),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Permanent Address"),
            subtitle: Text(permanentAddress),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Profile Description"),
            subtitle: Text(profileDescription),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile_edit');
              },
              child: Text("Edit Profile"),
            ),
          ),
        ],
      ),
    );
  }
}
