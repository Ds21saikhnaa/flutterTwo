import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test/ui/screens/edit_user_screen.dart';
import 'package:test/ui/screens/home_screen.dart';
import 'package:test/ui/screens/login_screen.dart';
import 'package:test/ui/screens/register_screen.dart';
import 'package:test/ui/screens/splash_screen.dart';
import 'package:test/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: homeRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        routes: <String, WidgetBuilder>{
          splashRoute: (context) => const SplashScreen(),
          loginRoute: (context) => const LoginScreen(),
          registerRoute: (context) => const RegisterScreen(),
          homeRoute: (context) => const HomeScreen(),
          editUserRoute: (context) => const EditUserScreen()
        }
        // title: 'Flutter Demo',
        );
  }
}
