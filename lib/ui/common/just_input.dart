import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class JustInput extends StatefulWidget {
  final String? title;
  final TextInputType keyboardType;
  String? text;
  JustInput({
    Key? key,
    this.title,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
//  const JustInput({Key? key}) : super(key: key);

  @override
  State<JustInput> createState() => _JustInputState();
}

class _JustInputState extends State<JustInput> {
  @override
  String _userName = '';
  bool _hasFocus = false;
  final FocusNode _focusNode = FocusNode();
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _hasFocus = _focusNode.hasFocus;
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 250, 248, 251),
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(
                  width: 1,
                  color: _hasFocus
                      ? Colors.black
                      : _userName.isEmpty
                          ? Color.fromARGB(255, 244, 242, 242)
                          : Colors.black,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  // text = value;
                  _userName = value;
                  // print("value: $value");
                  setState(() {});
                },
                focusNode: _focusNode,
                decoration: InputDecoration(
                    hintText: widget.title, fillColor: Colors.blue
                    // border: InputBorder.none,
                    ),
              ),
            ),
          ],
        ));
  }
}
