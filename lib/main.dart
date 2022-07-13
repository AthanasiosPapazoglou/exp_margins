// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade900,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              child: Text(
                'Margins',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 6, 0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                child: Icon(Icons.notifications),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 0, 16, 0),
                child: Icon(Icons.settings),
              ),
            ],
          ),
          body: const MainMenu(),
        ),
      ),
    );
  }
}
