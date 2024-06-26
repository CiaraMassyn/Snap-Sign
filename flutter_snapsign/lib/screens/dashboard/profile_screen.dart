import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.green,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('lib/images/carsProfile.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Full Name:', style: TextStyle(fontSize: 16)),
                subtitle: Text('John Doe', style: TextStyle(fontSize: 16)),
                onTap: () {
                  _showNameUpdateDialog(context);
                },
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Update',
                  color: Colors.teal,
                  icon: Icons.edit,
                  onTap: () {
                    _showNameUpdateDialog(context);
                  },
                ),
              ],
            ),
            Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Email:', style: TextStyle(fontSize: 16)),
                subtitle:
                    Text('johndoe@example.com', style: TextStyle(fontSize: 16)),
                onTap: () {
                  _showEmailUpdateDialog(context);
                },
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Update',
                  color: Colors.teal,
                  icon: Icons.edit,
                  onTap: () {
                    _showEmailUpdateDialog(context);
                  },
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.green,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Account Settings', style: TextStyle(fontSize: 16)),
              onTap: () {
                _showModal(context, 'Account Settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password', style: TextStyle(fontSize: 16)),
              onTap: () {
                _showModal(context, 'Change Password');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: Text(
                'Delete Account',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              onTap: () {
                _showModal(
                    context, 'Are you sure you want to delete your account?');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showNameUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Name'),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter your new name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.red)),
              ),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.green)),
              ),
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showEmailUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Email'),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter your new email"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.red)),
              ),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.green)),
              ),
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }


  void _showModal(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}



void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
