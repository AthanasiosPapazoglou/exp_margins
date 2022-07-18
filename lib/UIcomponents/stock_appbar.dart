// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class StockAppBar extends StatelessWidget {
  const StockAppBar({
    Key key,
    @required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey.shade900,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 6, 0),
          child: Icon(
            Icons.search,
            size: 30,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
          child: Icon(
            Icons.notifications,
            size: 30,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(6, 0, 16, 0),
          child: Icon(
            Icons.settings,
            size: 30,
          ),
        ),
      ],
    );
  }
}