// import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:test/ui/common/just_input.dart';
import 'package:test/ui/common/my_button.dart';
// import 'package:test/ui/common/my_input.dart';
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
              padding: const EdgeInsets.only(top: 168),
              // color: Colors.grey,
              child: Image.asset("assets/images/Logo.png"),
            ),
            JustInput(title: "Email or username"),
            JustInput(title: "password"),
            Container(
              // onTap:(){
              //   print("Clicked");
              // }
              alignment: FractionalOffset.centerRight,
              child: TextButton(
                onPressed: () {
                  // print("object");
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Color(0xFF3797EF)),
                ),
              ),
            ),
            const MyButton(
              text: "Log in",
              route: editUserRoute,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                  Text(
                    "Log in with Facebook",
                    // textAlign: TextAlign.end,
                    style: TextStyle(color: Color(0xFF3797EF)),
                  ),
                ],
              ),
            ),
            Row(
              children: const <Widget>[
                // Text("Book Name"),
                // Text("Author name"),
                Divider(
                  color: Colors.black,
                  // height: 20,
                ),
                // Text("OR"),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
