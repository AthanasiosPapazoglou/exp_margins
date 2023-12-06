// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exp_margins/UIcomponents/stock_appbar.dart';
import 'package:exp_margins/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_menu.dart';

void main() {
  runApp(const ExpenseMargins());
}

class ExpenseMargins extends StatelessWidget {
  const ExpenseMargins({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DataProviding(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.green.shade400,
          scaffoldBackgroundColor: Colors.blueGrey.shade900,
        ),
        home: Scaffold(
          body: const MainMenu(),
        ),
      ),
    );
  }
}

//commit test
