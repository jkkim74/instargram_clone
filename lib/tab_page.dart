import 'package:flutter/material.dart';
import 'package:instagram_clone/account_page.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabPage extends StatefulWidget {
  final User user;
  const TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  late List _pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      HomePage(widget.user),
      SearchPage(),
      AccountPage(widget.user),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _onItemTaped,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
      ]),
    );
  }

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
