import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String? title;
  final TextInputType keyboardType;

  const MyInput({
    Key? key,
    this.title,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
        onChanged: (value) {
          print("value: $value");
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: title
        ),
    );
  }
}