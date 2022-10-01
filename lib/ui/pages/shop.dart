import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;
import 'package:test/ui/common/just_input.dart';

import '../../utils/sp_manager.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  dynamic result;
  List<PlatformFile>? _files;
  String desc = "";
  void fileSelect() async {
    _files = (await FilePicker.platform.pickFiles(
            type: FileType.any, allowMultiple: false, allowedExtensions: null))!
        .files;
    //if (result == null) return;
    // file = result.files.first;
    // openFile(file);
  }

  void postAdd() async {
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    String accessToken = await sharedPreference.getAccessToken();
    try {
      var urlNewPost = Uri.parse('http://localhost:8000/api/v1/post/new');
      var response = await http.post(urlNewPost,
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $accessToken',
          },
          body: jsonEncode({'description': desc}));
      var responseData = Map<String, dynamic>.from(jsonDecode(response.body));
      var _id = responseData["_id"];
      if (responseData["success"] == true) {
        // var urlAddFile =
        //     Uri.parse('http://localhost:8000/api/v1/post/$_id/photo');
        // var response = await http.post(urlAddFile,
        //     headers: {
        //       "accept": "*/*",
        //       "Content-Type": "multipart/form-data",
        //       'Authorization': 'Bearer $accessToken',
        //     },
        //     body: jsonEncode({'description': desc}));
      }
    } catch (e) {
      print("${e.toString()}");
    }
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: fileSelect,
              child: Text("file"),
            ),
            JustInput(
              title: "post description",
              onChanged: (text) {
                desc = text;
              },
            ),
            InkWell(
              onTap: postAdd,
              child: Text("Post"),
            )
            // CachedNetworkImage(
            //   imageUrl: file!.path,
            //   placeholder: (context, url) => const CircularProgressIndicator(),
            //   fit: BoxFit.cover,
            //   height: 40,
            //   width: double.infinity,
            // ),
          ],
        ),
      ),
    );
  }
}
