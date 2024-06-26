import 'package:flutter/material.dart';
import 'package:flutter_snapsign/screens/dashboard/home_screen.dart';
import 'package:flutter_snapsign/screens/dashboard/profile_screen.dart';
import 'package:flutter_snapsign/screens/dashboard/topnav_screen.dart';
import 'package:flutter_snapsign/screens/dashboard/upload_screen.dart';

import 'package:flutter_snapsign/screens/login/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    UploadDocumentScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(logoutCallback: _logout),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
