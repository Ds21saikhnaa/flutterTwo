import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test/ui/edit_user_screen.dart';
import 'package:test/ui/home_screen.dart';
import 'package:test/ui/login_screen.dart';
import 'package:test/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: loginRoute,
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          loginRoute: (context) => const LoginScreen(),
          homeRoute: (context) => const HomeScreen(),
          editUserRoute: (context) => const EditUserScreen()
        }
        // title: 'Flutter Demo',
        );
  }
}
