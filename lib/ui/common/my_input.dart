import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final String? title;
  final TextInputType keyboardType;
  String? text;
  MyInput({
    Key? key,
    this.title,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
//  const MyInput({Key? key}) : super(key: key);

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
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
    String _userName = "";
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title! + "*"),
            Container(
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(
                  width: 2,
                  color: _hasFocus
                      ? Colors.red
                      : _userName.isEmpty
                          ? Colors.black
                          : Colors.red,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              // margin: EdgeInsets.only(
              //   // left: 20,
              //   // right: 20,
              //   // top: 20
              // ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // text = value;
                  _userName = value;
                  // print("value: $value");
                  setState(() {});
                },
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: widget.title,
                  // border: InputBorder.none,
                ),
              ),
            ),
          ],
        ));
  }
}
