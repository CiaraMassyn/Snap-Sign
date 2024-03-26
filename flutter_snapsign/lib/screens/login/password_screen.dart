import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  final String email;
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  PasswordScreen(this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( 
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Enter new password for $email', style: TextStyle(color: Colors.black)), 
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: newPasswordController,
                      obscureText: _isNewPasswordObscured,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_isNewPasswordObscured ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            _toggleNewPasswordVisibility();
                          },
                        ),
                      ),
                      style: TextStyle(color: Colors.black), 
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: _isConfirmPasswordObscured,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_isConfirmPasswordObscured ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            _toggleConfirmPasswordVisibility();
                          },
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        String newPassword = newPasswordController.text;
                        String confirmPassword = confirmPasswordController.text;
                        if (isValidPassword(newPassword, confirmPassword)) {
                          Navigator.pop(context); 
                          Navigator.pop(context); 
                          Navigator.pop(context); 
                        } else {
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7ED957),
                        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
                      ),
                      child: Text('Submit', style: TextStyle(color: Colors.black)), 
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Center(
              child: Text(
                'EST 2024',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleNewPasswordVisibility() {
    _isNewPasswordObscured = !_isNewPasswordObscured;
  }

  void _toggleConfirmPasswordVisibility() {
    _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
  }

  bool isValidPassword(String newPassword, String confirmPassword) {
    return newPassword.isNotEmpty && newPassword == confirmPassword;
  }
}