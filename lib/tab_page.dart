import 'package:flutter/material.dart';
import 'package:instagram_clone/home_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  final List _pages = [
    HomePage(),
    Text('page2'),
    Text('page3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
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
