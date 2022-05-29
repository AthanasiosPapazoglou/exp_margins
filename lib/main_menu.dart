// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'navPages/margins_page.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          MarginsPage(),
          Center(
            child: Text(
              'Flows',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Center(
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        onPageChanged: onNavBarTap,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.margin,
              ),
              label: 'Margins'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Flows'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edit'),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        onTap: onNavBarTap,
      ),
    );
  }
}
