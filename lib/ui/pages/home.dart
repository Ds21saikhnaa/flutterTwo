import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/ui/common/post_render.dart';
import 'package:http/http.dart' as http;
import 'package:test/ui/common/stories.dart';
import 'package:test/utils/sp_manager.dart';
//import 'package:test/services/remote_service.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
//import 'package:test/models/posts_list.dart';

class UserHome extends StatefulWidget {
  final List people = ["bat", "bat", "test"];
  UserHome({Key? key, people}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome>
    with AutomaticKeepAliveClientMixin<UserHome> {
  @override
  var posts;
  var isLoaded = false;
  void initState() {
    print("object");
    getData();
    super.initState();
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
      if (posts["success"] == true) {
        isLoaded = true;
        setState(() {});
      }
    } catch (e) {
      print("exception: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Instagram", style: TextStyle(color: Colors.black)),
            Row(
              children: const [
                Icon(Icons.add),
                Padding(
                  padding: EdgeInsets.all(24.0),
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
                  //itemCount: posts?["post"].length,
                  itemCount: widget.people.length,
                  itemBuilder: (context, index) {
                    return Stories(name: widget.people[index]);
                  })),
          Expanded(
            child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                itemCount: posts?["post"].length,
                itemBuilder: (context, index) {
                  return PostRender(
                    // name: widget.people[index],
                    // image: widget.people[index],
                    name: posts["post"][index]["createUser"]["name"],
                    image: posts["post"][index]["file"][0]["url"],
                    //image: posts["post"][index]["file"],
                    pro: posts["image"],
                    comment: posts["post"][index]["comments"][0]["comment"],
                    //data: posts
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
