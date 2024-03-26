import 'package:flutter/material.dart';
import 'package:flutter_snapsign/screens/login/otp_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
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
                    SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: 'test@example.com',
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'example@gmail.com',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.black), 
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OTPScreen('test@example.com', '000000')),
                        );
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
}