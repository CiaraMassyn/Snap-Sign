import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentSigningScreen extends StatelessWidget {
  final String filePath;

  DocumentSigningScreen({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Signing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SfPdfViewer.file(
                File(filePath),
              ),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Sign Document'),
            ),
          ],
        ),
      ),
    );
  }
}
