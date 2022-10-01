//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/api_controller.dart';
import 'package:test/ui/common/post_render.dart';
import 'package:test/ui/common/stories.dart';

class UserHome extends StatefulWidget {
  final List people = [
    "bat",
    "bat",
    "test",
    "bat",
    "bat",
    "test",
    "bat",
    "bat",
    "test",
    "bat",
    "bat",
    "test"
  ];
  UserHome({Key? key, people}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome>
    with AutomaticKeepAliveClientMixin<UserHome> {
  ValueNotifier<bool> isLoaded = ValueNotifier(false);
  final _apiController = Get.put(ApiController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isLoaded.value = true;
      await _apiController.getData().then((_) => isLoaded.value = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: _apiController.postInfo.length,
                itemCount: widget.people.length,
                itemBuilder: (context, index) {
                  return Stories(
                      // name: _apiController.postInfo[index]["createUser"]
                      //     ["name"]);
                      name: widget.people[index]);
                }),
          ),
          ValueListenableBuilder(
            valueListenable: isLoaded,
            builder: (_, bool value, __) {
              return value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : //Text(_apiController.postInfo[0].toString());
                  SizedBox(
                      height: 500,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _apiController.postInfo.length,
                        itemBuilder: (context, index) {
                          return PostRender(
                              data: _apiController.postInfo[index]);
                        },
                      ),
                    );
            },
          ),
          // ListView.builder(
          //   itemCount: _apiController.postInfo.length,
          //   itemBuilder: (context, index) {
          //     return PostRender(data: _apiController.postInfo[index]);
          //   },
          // ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

//body: ValueListenableBuilder(
      //   valueListenable: isLoaded,
      //   builder: (_, bool value, __) {
      //     return value
      //         ? Center(
      //             child: CircularProgressIndicator(),
      //           )
      //         : Column(
      //             children: [
      //               Container(
      //                 height: 130,
      //                 child: ListView.builder(
      //                     scrollDirection: Axis.horizontal,
      //                     itemCount: _apiController.postInfo.length,
      //                     itemBuilder: (context, index) {
      //                       return Stories(
      //                           name: _apiController.postInfo[index]
      //                               ["createUser"]["name"]);
      //                     }),
      //               ),
      //               ListView.builder(
      //                 itemCount: _apiController.postInfo.length,
      //                 itemBuilder: (context, index) {
      //                   return PostRender(data: _apiController.postInfo[index]);
      //                 },
      //               ),
      //             ],
      //           );
      //   },
      // ),