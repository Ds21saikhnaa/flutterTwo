import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Post extends StatefulWidget {
  final String? name;
  const Post({Key? key, this.name}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                      color: Colors.grey[200], shape: BoxShape.circle),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Icon(Icons.menu),
          ],
        ),
      ),
      Container(
        height: 400,
        color: Colors.grey[300],
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
            Text(widget.name!, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(" and "),
            Text("others", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 8),
        child: RichText(
          text: TextSpan(style: TextStyle(color: Colors.black), children: [
            TextSpan(
                text: widget.name!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
              text:
                  " When you join Toptal, you get the freedom of freelance with the security of full-time. Take control of your career today.",
            ),
          ]),
          // Text("liked by"),
          // Text(" name ", style: TextStyle(fontWeight: FontWeight.bold)),
          // Text(" and "),
          // Text("others", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    ]);
  }
}
