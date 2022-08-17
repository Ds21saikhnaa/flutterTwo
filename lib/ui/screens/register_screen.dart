import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/ui/common/just_input.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test/utils/routes.dart';

import '../../utils/sp_manager.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //body: Container(child: Text("data")),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: (() => Get.toNamed(loginRoute)),
                child: const Text("back"),
              ),
              Container(
                padding: const EdgeInsets.only(top: 168),
                // color: Colors.grey,
                child: Image.asset("assets/images/Logo.png"),
              ),
              JustInput(
                title: "Email",
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
                isHidden: true,
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
