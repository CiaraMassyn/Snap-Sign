import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePadWidget extends StatefulWidget {
  final double strokeWidth;
  final Function(Uint8List?)? onSignatureChanged;

  const SignaturePadWidget({Key? key, required this.strokeWidth, this.onSignatureChanged}) : super(key: key);

  @override
  _SignaturePadWidgetState createState() => _SignaturePadWidgetState();
  
  getSignatureBytes() {}
}

class _SignaturePadWidgetState extends State<SignaturePadWidget> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Signature(
              controller: _controller,
              height: 400,
              backgroundColor: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.red)),
                  ),
                  child: Text('Close'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    final signatureData = await widget.getSignatureBytes();
                    if (widget.onSignatureChanged != null && signatureData != null) {
                      widget.onSignatureChanged!(signatureData);
                    }
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.transparent; 
                      },
                    ),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.green.withOpacity(0.2); 
                      },
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.green), 
                    ),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        return 0; 
                      },
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> clear() async {
    _controller.clear();
  }

  Future<Uint8List?> getSignatureBytes() async {
    return await _controller.toPngBytes();
  }
}
