import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter_snapsign/screens/dashboard/documentSign_screen.dart';

class UploadDocumentScreen extends StatefulWidget {
  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  File? _document;

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'], 
    );

    if (result != null) {
      setState(() {
        _document = File(result.files.single.path!);
      });
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Document'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _document != null
                ? Image.file(_document!)
                : Icon(Icons.insert_drive_file, size: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickDocument,
              child: Text('Select Document'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_document != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DocumentSigningPage(document: _document!)),
                  );
                } else {
                  // Handle no document selected
                }
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
