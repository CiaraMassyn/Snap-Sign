import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                side: BorderSide(color: Colors.green),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}