import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/sp_manager.dart';

class ApiController extends GetxController {
  // RxMap<String, dynamic> postInfo = RxMap();
  List<dynamic> postInfo = [].obs;

  Future<dynamic> getData() async {
    var url = Uri.parse('http://localhost:8000/api/v1/post/');
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    String accessToken = await sharedPreference.getAccessToken();
    try {
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $accessToken',
      });
      var responseData = Map<String, dynamic>.from(jsonDecode(response.body));
      if (responseData["success"] == true) {
        postInfo.addAll(responseData["post"]);
      }
      return responseData;
    } catch (e) {
      print("${e.toString()}");
    }
  }
}
