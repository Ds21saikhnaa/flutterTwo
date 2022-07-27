import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String? link;
  const Profile({
    Key? key,
    this.link = "https://picsum.photos/id/237/200/300",
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          width: 1,
          color: Colors.grey
        ),
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/id/237/200/300"),
        fit: BoxFit.cover)
      ),
    );
  }
}