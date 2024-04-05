import 'package:flutter/material.dart';

class EditTextWidget extends StatefulWidget {
  final Offset initialPosition;
  final void Function(Offset, String) onPositionChanged;

  const EditTextWidget({
    Key? key,
    required this.initialPosition,
    required this.onPositionChanged,
  }) : super(key: key);

  @override
  _EditTextWidgetState createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.initialPosition.dx,
      top: widget.initialPosition.dy,
      child: Draggable(
        feedback: Material(
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Text(_textEditingController.text),
          ),
        ),
        childWhenDragging: SizedBox(),
        onDragEnd: (details) {
          widget.onPositionChanged(details.offset, _textEditingController.text);
        },
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type here',
          ),
        ),
      ),
    );
  }
}
