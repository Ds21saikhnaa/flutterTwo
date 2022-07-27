import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// class MyInput extends StatefulWidget {
//     final String? title;
//   final TextInputType keyboardType;
//   final FocusNode _focusNode = FocusNode();
//   bool _hasFocus = false;
//   String? text;
//     MyInput({
//     Key? key,
//     this.title,
//     this.keyboardType = TextInputType.text,
//   }) : super(key: key);
// //  const MyInput({Key? key}) : super(key: key);

//   @override
//   State<MyInput> createState() => _MyInputState();
// }

// class _MyInputState extends State<MyInput> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("title!" + "*"),
//             Container(
//               decoration: BoxDecoration(
//                 // color: Colors.green,
//                 border: Border.all(
//                   width: 1,
//                   color: Colors.black,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               // margin: EdgeInsets.only(
//               //   // left: 20,
//               //   // right: 20,
//               //   // top: 20
//               // ),
//               padding: EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//               ),
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   // text = value;
//                   print("value: $value");
//                 },
//                 decoration: InputDecoration(
//                   hintText: "title,"
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
class MyInput extends StatelessWidget {
  final String? title;
  final TextInputType keyboardType;
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  String? text;

  MyInput({
    Key? key,
    this.title,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  // void initState() {
  //   super.initState();

  //   _focusNode.addListener(() {
  //     _hasFocus = _focusNode.hasFocus;
  //     setState(() {});
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title! + "*"),
            Container(
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              // margin: EdgeInsets.only(
              //   // left: 20,
              //   // right: 20,
              //   // top: 20
              // ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  text = value;
                  //print("value: $value");
                },
                decoration: InputDecoration(
                  hintText: title,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ));
  }
}
