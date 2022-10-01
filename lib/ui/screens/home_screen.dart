import 'package:flutter/material.dart';
import 'package:test/ui/pages/account.dart';
import 'package:test/ui/pages/home.dart';
import 'package:test/ui/pages/reels.dart';
import 'package:test/ui/pages/search.dart';
import 'package:test/ui/pages/shop.dart';

import '../customs/custom_inkwell.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int _selectIndex = 0;
  double _bottomPadding = 0.0;
  final PageController _pageController = PageController();
  final List<IconData> _dummyData = [
    Icons.home,
    Icons.search,
    Icons.video_call,
    Icons.shop,
    Icons.person,
  ];
  final List<Widget> _children = [
    UserHome(),
    Search(),
    Reels(),
    Shop(),
    Account()
  ];
  @override
  Widget build(BuildContext context) {
    _bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _children,
      ),
      bottomNavigationBar: _customNavigationBar(),
    );
  }

  Widget _customNavigationBar() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 50 + _bottomPadding,
      padding: EdgeInsets.only(bottom: _bottomPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _dummyData.asMap().entries.map((entry) {
          int idx = entry.key;
          IconData val = entry.value;

          return CustomNavigationItem(
            index: idx,
            iconData: val,
            onClickListener: (selectedIndex) async {
              _pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavigationItem extends StatelessWidget {
  final int? index;
  final IconData? iconData;
  final Function(int)? onClickListener;

  const CustomNavigationItem({
    Key? key,
    this.index,
    this.iconData,
    this.onClickListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInkWell(
            onTap: () {
              if (onClickListener != null) onClickListener!(index ?? 0);
            },
            child: SizedBox(
              width: 48,
              height: 48,
              child: Icon(
                iconData,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
