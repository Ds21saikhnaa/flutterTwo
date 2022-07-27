import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          print("da");
          _isSelected = !_isSelected;
          setState(() {});
        },
        child: MaterialButton(
          elevation: 0,
          padding: EdgeInsets.only(top: 40),
          onPressed: () {
            _isSelected = !_isSelected;
            setState(() {});
            // print("Clicked");
            // Get.back();
            // Get.offAllNamed(secondRoute);
          },
          child: Container(
              height: 40,
              width: 350,
              alignment: Alignment.center,
              child: Text('Click me'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _isSelected
                    ? Color.fromARGB(255, 213, 140, 135)
                    : Colors.red,
              )),
        ),
      ),
    );
  }
}
