import 'package:flutter/material.dart';
import 'package:flutter_snapsign/screens/login/password_screen.dart';

class OTPScreen extends StatelessWidget {
  final String email;
  final String otp;

  OTPScreen(this.email, this.otp);

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
                    Text('An OTP has been sent to $email', style: TextStyle(color: Colors.black)), 
                    SizedBox(height: 16.0),
                    _buildOTPDigitFields(context),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PasswordScreen(email)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7ED957),
                        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
                      ),
                      child: Text('Verify OTP', style: TextStyle(color: Colors.black)), 
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

 Widget _buildOTPDigitFields(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(
      6,
      (index) => SizedBox(
        width: 50, 
        height: 50, 
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            counterText: '', 
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: TextStyle(fontSize: 24), 
          onChanged: (value) {
            if (value.length == 1) {
              if (index < 5) {
                FocusScope.of(context).nextFocus(); 
              } else {
                FocusScope.of(context).unfocus(); 
              }
            }
          },
        ),
      ),
    ),
  );
 }
}