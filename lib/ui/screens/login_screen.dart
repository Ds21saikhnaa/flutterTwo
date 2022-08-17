import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test/ui/common/just_input.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:test/utils/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test/utils/sp_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  String password = "";
  void logInFunction() async {
    var url = Uri.parse('http://localhost:8000/api/v1/users/login/');
    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'email': name, 'password': password}));
      var extractedData = Map<String, dynamic>.from(jsonDecode(response.body));
      String confToken = extractedData['token'];
      if (extractedData["success"] == true) {
        SpManager sharedPreference = SpManager();
        await sharedPreference.init();
        sharedPreference.saveAccessToken(confToken);
        // String accessToken = await sharedPreference.getAccessToken();
        Get.offAllNamed(homeRoute);
      }
    } catch (e) {
      print("exception: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
              JustInput(
                title: "Email or username",
                onChanged: (text) {
                  name = text;
                },
              ),
              JustInput(
                title: "password",
                onChanged: (text) {
                  password = text;
                },
                isHidden: true,
              ),
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
              MyButton(text: "Log in", onPressed: logInFunction),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20),
                child: Container(
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Text("_________________",
                      style: TextStyle(color: Color(0x33000000))),
                  Text("OR", style: TextStyle(color: Color(0x33000000))),
                  Text("_________________",
                      style: TextStyle(color: Color(0x33000000))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 50),
                child: Row(
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(color: Colors.grey)),
                    InkWell(
                      onTap: () {
                        Get.toNamed(registerRoute);
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
      ),
    );
  }
}
