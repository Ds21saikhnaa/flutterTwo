import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/ui/common/just_input.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:test/utils/routes.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = "";
  String email = "";
  String password = "";
  void registerFunction() async {
    var url = Uri.parse('http://localhost:8000/api/v1/users/register/');
    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({'email': email, 'name': name, 'password': password}));
      // print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // print(response.body.fromJson);
      // if(isSuccess == true){
      //   Get.toNamed(registerRoute);
      // }
    } catch (e) {
      print("exception: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //body: Container(child: Text("data")),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 168),
                // color: Colors.grey,
                child: Image.asset("assets/images/Logo.png"),
              ),
              JustInput(
                title: "Email or username",
                onChanged: (text) {
                  email = text;
                },
              ),
              JustInput(
                title: "Username",
                onChanged: (text) {
                  name = text;
                },
              ),
              JustInput(
                title: "password",
                onChanged: (text) {
                  password = text;
                },
              ),
              MyButton(
                text: "Sign up",
                onPressed: registerFunction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
