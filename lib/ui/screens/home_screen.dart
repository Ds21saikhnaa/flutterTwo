import 'package:flutter/material.dart';
import 'package:test/ui/pages/account.dart';
import 'package:test/ui/pages/home.dart';
import 'package:test/ui/pages/reels.dart';
import 'package:test/ui/pages/search.dart';
import 'package:test/ui/pages/shop.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  void _navigateBottomNavbar(int num) {
    _selectIndex = num;
    setState(() {});
  }

  final List<Widget> _children = [
    UserHome(),
    Search(),
    Reels(),
    Shop(),
    Account()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _navigateBottomNavbar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'account',
          ),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}
