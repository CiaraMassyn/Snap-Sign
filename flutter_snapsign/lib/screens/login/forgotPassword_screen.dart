import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final String email;

  ForgotPasswordScreen({this.email = ''});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController(text: email);

    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/snapSignWhiteBackground.jpg',
                      height: 100,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Provide email to reset password',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 1.9,
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'example@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7ED957),
                          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
