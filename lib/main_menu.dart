// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:exp_margins/navPages/flows_page.dart';
import 'package:flutter/material.dart';

import 'navPages/margins_page.dart';
import 'navPages/profile_page.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedNavigationIndex = 0;
  String _currentPage = 'MarginsPage';
  //PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'MarginsPage': MarginsPage(),
      'FlowsPage': FlowsPage(),
      'ProfilePage': ProfilePage(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      //extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey.shade900,
        selectedItemColor: Colors.green.shade400,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedNavigationIndex,
        onTap: (i) {
          setState(() {
            _currentPage = tabs.keys.toList()[i];
            _selectedNavigationIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Margins',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.swap_horiz,
            ),
            label: 'Flows',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}