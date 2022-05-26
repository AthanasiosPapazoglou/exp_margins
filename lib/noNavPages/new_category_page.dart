// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCategoryPage extends StatelessWidget {
  const NewCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.blueGrey.shade900,
            height: 30,
            width: 30,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: ThemeData.dark().primaryColor
                )
              ),
              child: Center(
                child: Text(
                  '?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
