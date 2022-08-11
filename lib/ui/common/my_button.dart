import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  final String? text;
  final Function()? onPressed;
  const MyButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: MaterialButton(
        elevation: 0,
        onPressed: widget.onPressed,
        // _isSelected = !_isSelected;
        // setState(() {});
        // Get.back();
        // Get.offAllNamed(secondRoute);
        child: Container(
          height: 44,
          width: 343,
          alignment: Alignment.center,
          child: Text(widget.text!, style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _isSelected
                ? Color.fromARGB(255, 213, 140, 135)
                : Color(0xFF3797EF),
          ),
        ),
      ),
    );
  }
}
