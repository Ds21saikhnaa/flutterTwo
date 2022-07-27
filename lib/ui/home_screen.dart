import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:test/ui/common/my_input.dart';
import 'package:test/ui/common/pro_flie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _text = "Hello world";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
          
            child: Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Profile(),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     border: Border.all(
          //       width: 1,
          //       color: Colors.black,
          //     ),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   margin: EdgeInsets.only(
          //     left: 20,
          //     right: 20,
          //   ),
          //   child: Column(
          //     children: [
          //     ],
          //   ),
          // ),
                MyInput(
                  title: "Full Name",
                  keyboardType: TextInputType.number,
                ),
                MyInput(title: "Email"),
                MyInput(title: "Phone Number"),
                MyInput(title: "Gender"),
                MyInput(title: "Location"),
        ],
      ),
    ))
    );
  }
}
