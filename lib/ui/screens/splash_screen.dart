import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test/utils/routes.dart';
import 'package:test/utils/sp_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SpManager sharedPreference = SpManager();
      await sharedPreference.init();
      String accessToken = await sharedPreference.getAccessToken();
      sharedPreference.saveAccessToken("");
      print("accessToken: $accessToken");

      Get.offAllNamed(accessToken.isNotEmpty ? homeRoute : loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
