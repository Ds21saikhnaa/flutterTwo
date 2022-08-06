import 'package:flutter/material.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:test/ui/common/my_input.dart';
import 'package:test/ui/common/pro_flie.dart';
import 'package:test/utils/routes.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  // String _text = "Hello world";
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
              const Profile(),
              MyInput(
                title: "Full Name",
                keyboardType: TextInputType.number,
              ),
              MyInput(title: "Email"),
              MyInput(title: "Phone Number"),
              MyInput(title: "Gender"),
              MyInput(title: "Location"),
              const MyButton(
                text: "go home",
                route: homeRoute,
              ),
              const MyButton(
                text: "go Login",
                route: loginRoute,
              )
            ],
          ),
        )));
  }
}
