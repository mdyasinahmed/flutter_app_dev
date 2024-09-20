import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchUsers();
  }

  // Fetch Users
  fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse('https://reqres.in/api/users');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['data'];
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      setState(() {
        users = [];
        isLoading = false;
      });
    }
  }

  // Delete User
  deleteUser(int id) async {
    var url = Uri.parse('https://reqres.in/api/users/$id');
    var response = await http.delete(url);
    if (response.statusCode == 204) {
      setState(() {
        users.removeWhere((element) => element['id'] == id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User deleted successfully!')),
      );
    }
  }

  // Create User with User Input including email and picture URL
  Future<void> createUser(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController jobController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController avatarController = TextEditingController(); // For picture URL

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(labelText: 'Job'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: avatarController,
              decoration: InputDecoration(labelText: 'Picture URL'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              var name = nameController.text;
              var job = jobController.text;
              var email = emailController.text;
              var avatar = avatarController.text;

              if (name.isNotEmpty && job.isNotEmpty && email.isNotEmpty && avatar.isNotEmpty) {
                var url = Uri.parse('https://reqres.in/api/users');
                var response = await http.post(url, body: {
                  'name': name,
                  'job': job,
                  'email': email,
                  'avatar': avatar,
                });

                if (response.statusCode == 201) {
                  var newUser = json.decode(response.body);
                  setState(() {
                    users.insert(0, newUser);
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User created successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create user!')),
                  );
                }
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  // Update User
  updateUser(int id) async {
    var url = Uri.parse('https://reqres.in/api/users/$id');
    var response = await http.put(url, body: {'name': 'Jane Doe', 'job': 'Manager'});
    if (response.statusCode == 200) {
      setState(() {
        fetchUsers();  // Refresh users list after update
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User updated successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update user!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD App'),
      ),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createUser(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget getBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return getCard(users[index]);
      },
    );
  }

  Widget getCard(user) {
    var fullName = user['first_name'] != null ? user['first_name'] : user['name'];
    var email = user['email'] != null ? user['email'] : 'No email available';
    var avatar = user['avatar'] != null ? user['avatar'] : null;

    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: avatar != null ? NetworkImage(avatar) : null,
          child: avatar == null ? Icon(Icons.person) : null,
        ),
        title: Text(fullName),
        subtitle: Text(email),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              updateUser(user['id']);
            } else if (value == 'delete') {
              deleteUser(user['id']);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
