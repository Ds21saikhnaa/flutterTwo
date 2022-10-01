// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class PostRender extends StatefulWidget {
  final Map<String, dynamic>? data;
  // final String? name;
  // final String? image;
  // final String? comment;
  // final String? pro;
  // this.name, this.image, this.comment, this.pro,
  const PostRender({Key? key, this.data}) : super(key: key);

  @override
  State<PostRender> createState() => _PostRenderState();
}

class _PostRenderState extends State<PostRender> {
  String name = "";
  String image = "";
  String comment = "";
  String pro =
      "https://secure.gravatar.com/avatar/4b21ce3917fcb75324268ba4d3143c37?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Fdefault-avatar-0.png";

  @override
  void initState() {
    //print("object ${widget.data?["post"][0]["file"][0]["url"]}");
    image = widget.data?["file"][0]["url"];
    name = widget.data?["createUser"]["name"];
    comment = widget.data?["comments"][0]["comment"];
    super.initState();
  }

  //var file = Map<String, dynamic>.from(jsonDecode(widget.image!));
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40 / 2),
                    child: CachedNetworkImage(
                      imageUrl: pro,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.cover,
                      height: 40,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            PopupMenuButton(
                onSelected: (item) {
                  // _selectedMenu = item.name;
                  setState(() {});
                },
                itemBuilder: (BuildContext ctx) => <PopupMenuEntry>[
                      const PopupMenuItem<Menu>(
                        value: Menu.itemOne,
                        child: Text('delete to post'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemTwo,
                        child: Text('uptade post'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemThree,
                        child: Text('Item 3'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemFour,
                        child: Text('Item 4'),
                      ),
                    ])
            //const Icon(Icons.menu),
          ],
        ),
      ),
      Container(
        height: 400,
        color: Colors.grey[300],
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => const CircularProgressIndicator(),
          fit: BoxFit.cover,
          height: 400,
          width: double.infinity,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.favorite),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(Icons.chat_bubble_outline),
                ),
                Icon(Icons.share),
              ],
            ),
            const Icon(Icons.bookmark)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Text("liked by "),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(" and "),
            Text("others", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 8),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                  text: name, style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                text: " ${comment}",
              ),
            ],
          ),
          // Text("liked by"),
          // Text(" name ", style: TextStyle(fontWeight: FontWeight.bold)),
          // Text(" and "),
          // Text("others", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    ]);
  }
}
