import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class Stories extends StatefulWidget {
  final String? name;
  const Stories({Key? key, this.name}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   width: 62,
        //   height: 62,
        //   padding: const EdgeInsets.all(2),
        //   margin: const EdgeInsets.only(right: 10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(62 / 2),
        //     gradient: const LinearGradient(
        //       begin: Alignment.bottomLeft,
        //       end: Alignment.topRight,
        //       colors: <Color>[
        //         Color(0xffFBAA47),
        //         Color(0xffD91A46),
        //         Color(0xffA60F93),
        //       ],
        //       tileMode: TileMode.mirror,
        //     ),
        //   ),
        //   child: Container(
        //     width: 60,
        //     height: 60,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(60 / 2),
        //     ),
        //     padding: const EdgeInsets.all(2),
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(60 / 2),
        //       // child: CachedNetworkImage(
        //       //   imageUrl:
        //       //       "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        //       //   placeholder: (context, url) => CircularProgressIndicator(),
        //       //   fit: BoxFit.cover,
        //     ),
        //   ),
        // );
        //);

        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: <Color>[
                        Color(0xffFBAA47),
                        Color(0xffD91A46),
                        Color(0xffA60F93),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.name!)
              ],
            ));
  }
}
