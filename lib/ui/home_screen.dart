import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:test/ui/common/my_input.dart';

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
        body: SafeArea(
            child: Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("hello"),
          Text("hello1"),
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
    )));
  }
}
