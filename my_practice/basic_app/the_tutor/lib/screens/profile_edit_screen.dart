import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Username")),
            TextField(decoration: InputDecoration(labelText: "Contact Number")),
            TextField(decoration: InputDecoration(labelText: "Present Address")),
            TextField(decoration: InputDecoration(labelText: "Permanent Address")),
            TextField(decoration: InputDecoration(labelText: "Profile Description")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
