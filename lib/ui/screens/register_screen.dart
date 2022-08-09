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
              Container(
                padding: const EdgeInsets.only(top: 168),
                // color: Colors.grey,
                child: Image.asset("assets/images/Logo.png"),
              ),
              JustInput(title: "Email or username"),
              JustInput(title: "Username"),
              JustInput(title: "password"),
              const MyButton(
                text: "Sign up",
                route: loginRoute,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
