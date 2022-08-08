import 'package:flutter/material.dart';
import 'package:test/ui/common/just_input.dart';
import 'package:test/ui/common/my_button.dart';
import 'package:test/utils/routes.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //body: Container(child: Text("data")),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              JustInput(title: "Email or username"),
              JustInput(title: "password"),
              const MyButton(
                text: "Log in",
                route: loginRoute,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
