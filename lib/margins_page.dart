// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MarginsPage extends StatelessWidget {
  MarginsPage({Key? key}) : super(key: key);

  final List<String> dummyCategories = [
    'Home',
    'Food',
    'Clothing',
    'Coffee',
    'Snacks',
    'Gas'
  ];

  final List<Color> dummyColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple
  ];

  final List<IconData> dummyIcons = [
    Icons.shopping_cart_outlined,
    Icons.food_bank_outlined,
    Icons.shopping_bag,
    Icons.coffee,
    Icons.fastfood_rounded,
    Icons.local_gas_station
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: dummyColor[index]),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(dummyIcons[index],
                      color: Colors.black),
                      SizedBox(width: 6),
                      Text(
                        dummyCategories[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Text('120', style: TextStyle(color: Colors.black),)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
