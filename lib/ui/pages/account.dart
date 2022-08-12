import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/utils/routes.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart';
import 'package:test/utils/sp_manager.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  void logOut() async {
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    sharedPreference.delete();
    Get.offAllNamed(loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: logOut,
        child: const Text("log out"),
      )),
    );
  }
}
