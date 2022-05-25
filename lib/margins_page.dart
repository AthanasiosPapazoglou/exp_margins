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

  final List<double> dummyPercentage = [
    .8,
    .65,
    .85,
    .45,
    .55,
    .35,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: dummyColor[index].withOpacity(.4),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TweenAnimationBuilder<double>(
                  duration: Duration(seconds: 2),
                  tween: Tween<double>(begin: 1, end: dummyPercentage[index]),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Container(
                      width: MediaQuery.of(context).size.width * value,
                      height: 64,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: dummyColor[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          dummyIcons[index],
                          color: Colors.black,
                          size: 25,
                        ),
                        SizedBox(width: 6),
                        Text(
                          dummyCategories[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    TweenAnimationBuilder<double>(
                      duration: Duration(seconds: 2),
                      tween: Tween<double>(
                          begin: 120, end: dummyPercentage[index] * 120),
                      builder:
                          (BuildContext context, double val2, Widget? child) {
                        int displayValue = val2.toInt();
                        return Text(
                          '$displayValue/120',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
