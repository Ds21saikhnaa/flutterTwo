import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class JustInput extends StatefulWidget {
  final String? title;
  String? inVal;
  final TextInputType keyboardType;
  String? text;
  JustInput({
    Key? key,
    this.title,
    this.inVal,
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
        color: const Color(0xA1FAFAFA),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.blueAccent,
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(
                  width: 1,
                  color: _hasFocus
                      ? Colors.black
                      : _userName.isEmpty
                          ? const Color.fromARGB(255, 244, 242, 242)
                          : Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  // text = value;
                  _userName = value;
                  widget.inVal = value;
                  // print("value: $value");
                  setState(() {});
                },
                focusNode: _focusNode,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.title,
                    fillColor: Colors.blue
                    // border: InputBorder.none,
                    ),
              ),
            ),
          ],
        ));
  }
}
