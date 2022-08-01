import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  final String? route;
  final String? text;
  const MyButton({Key? key, this.route, this.text}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: InkWell(
        // onTap: () {
        //   print("da");
        //   _isSelected = !_isSelected;
        //   setState(() {});
        // },
        child: MaterialButton(
          elevation: 0,
          onPressed: () {
            Get.toNamed(widget.route!);
            // _isSelected = !_isSelected;
            // setState(() {});
            print("Clicked");
            // Get.back();
            // Get.offAllNamed(secondRoute);
          },
          child: Container(
            height: 44,
            width: 343,
            alignment: Alignment.center,
            child: Text(widget.text!, style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: _isSelected
                  ? Color.fromARGB(255, 213, 140, 135)
                  : Color.fromARGB(255, 54, 152, 244),
            ),
          ),
        ),
      ),
    );
  }
}
