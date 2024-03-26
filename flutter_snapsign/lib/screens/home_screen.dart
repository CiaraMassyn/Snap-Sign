import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black, 
            fontSize: 24, 
          ),
        ),
      ),
    );
  }
}
