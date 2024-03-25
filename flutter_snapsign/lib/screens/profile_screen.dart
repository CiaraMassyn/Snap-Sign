import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/user_profile.jpg'),
            ),
            title: Text('John Doe'),
            subtitle: Text('john.doe@example.com'),
          ),
          ListTile(
            title: Text('Posts'),
            trailing: Text('123'),
          ),
          ListTile(
            title: Text('Followers'),
            trailing: Text('456'),
          ),
          ListTile(
            title: Text('Following'),
            trailing: Text('789'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
