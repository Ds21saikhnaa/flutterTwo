import 'package:flutter/material.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:test/ui/common/my_input.dart';
import 'package:test/ui/common/pro_flie.dart';
import 'package:test/utils/routes.dart';

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
              MyInput(
                title: "Full Name",
                keyboardType: TextInputType.number,
              ),
              MyInput(title: "Email"),
              MyInput(title: "Phone Number"),
              MyInput(title: "Gender"),
              MyInput(title: "Location"),
              MyButton(
                text: "go Login",
                route: loginRoute,
              )
            ],
          ),
        )));
  }
}
