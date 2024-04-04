import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _pickedFile;

  Future<void> _pickFile() async {
    if (await Permission.storage.request().isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _pickedFile = File(result.files.single.path!);
        });
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Permission Required'),
          content: Text('Please grant permission to access device storage.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
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
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Select Document'),
            ),
            if (_pickedFile != null) Text('Selected: ${_pickedFile!.path}'),
          ],
        ),
      ),
    );
  }
}
