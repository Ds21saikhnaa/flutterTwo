import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/services/remote_service.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:test/ui/common/post_render.dart';
import 'package:test/models/posts_list.dart';
import 'package:http/http.dart' as http;
import 'package:test/ui/common/stories.dart';
import 'package:test/utils/sp_manager.dart';

class UserHome extends StatefulWidget {
  final List people = ["bat", "dorj", "dulmaa", "axio", "bileg", "tuya"];
  UserHome({Key? key, people}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var url = Uri.parse('http://localhost:8000/api/v1/post/');
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    String accessToken = await sharedPreference.getAccessToken();
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      posts = Map<String, dynamic>.from(jsonDecode(response.body));
      print(posts);
      if (posts["success"] == true) {}
    } catch (e) {
      print("exception: ${e.toString()}");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Instagram", style: TextStyle(color: Colors.black)),
            Row(
              children: const [
                Icon(Icons.add),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Icon(Icons.favorite),
                ),
                Icon(Icons.share),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.people.length,
                  itemBuilder: (context, index) {
                    return Stories(name: widget.people[index]);
                  })),
          Expanded(
            child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return PostRender(
                  name: posts![index].name,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
