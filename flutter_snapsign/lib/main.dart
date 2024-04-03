import 'package:flutter/material.dart';
import 'package:flutter_snapsign/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snap Sign',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_snapsign/screens/login/login_screen.dart';
// import 'package:flutter_snapsign/widgets/pdf_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Snap Sign',
//       home: LoginScreen(),
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/pdfDisplay': (context) => PdfDisplayScreen(),
//       },
//     );
//   }
// }
