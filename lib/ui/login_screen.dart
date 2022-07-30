import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/ui/common/just_input.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:test/ui/common/my_input.dart';
import 'package:test/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 168),
              // color: Colors.grey,
              child: Image.asset("assets/images/Logo.png"),
            ),
            JustInput(title: "Email or username"),
            JustInput(title: "password"),
            // MyInput(title: "Email or username"),
            // MyInput(title: "password"),
            MyButton(
              text: "Log in",
              route: homeRoute,
            ),
          ]),
        ),
      ),
    );
  }
}
