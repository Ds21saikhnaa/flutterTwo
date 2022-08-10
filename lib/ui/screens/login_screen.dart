import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test/ui/common/just_input.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:test/utils/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                // Text("Book Name"),
                // Text("Author name"),
                Text("_________________",
                    style: TextStyle(color: Color(0x33000000))),
                Text("OR", style: TextStyle(color: Color(0x33000000))),
                Text("_________________",
                    style: TextStyle(color: Color(0x33000000))),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 100, top: 50),
              child: Row(
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(color: Colors.grey)),
                  InkWell(
                    onTap: () async {
                      var url = Uri.parse(
                          'http://localhost:8000/api/v1/users/login/');
                      try {
                        var response = await http.post(url,
                            headers: {"Content-Type": "application/json"},
                            body: jsonEncode({
                              'email': 'bat@gmail.com',
                              'password': '1234'
                            }));
                        print('Response status: ${response.statusCode}');
                        print('Response body: ${response.body}');

                        // if(isSuccess == true){
                        //   Get.toNamed(registerRoute);
                        // }
                      } catch (e) {
                        print("exception: ${e.toString()}");
                      }
                    },
                    child: const Text(
                      "Sign up.",
                      style: TextStyle(color: Color(0xFF3797EF)),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
