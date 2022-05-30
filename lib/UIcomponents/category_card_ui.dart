// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'dart:math';

class CategoryItemUI extends StatelessWidget {
  const CategoryItemUI({
    Key? key,
    required this.marginAmount,
    required this.remainingAmount,
    required this.cardColor,
    required this.categoryIcon,
    required this.categoryName,
  }) : super(key: key);

  final double marginAmount;
  final double remainingAmount;
  final Color cardColor;
  final IconData categoryIcon;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
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
              color: cardColor.withOpacity(.4),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 1500),
              tween: Tween<double>(begin: 1.0, end: remainingAmount/marginAmount),
              builder: (BuildContext context, double val1, Widget? child) {
                return Container(
                  width: MediaQuery.of(context).size.width * val1,
                  height: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cardColor),
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
                      categoryIcon,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(width: 6),
                    Text(
                      categoryName,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 1500),
                  tween:
                      Tween<double>(begin: marginAmount, end: remainingAmount),
                  builder: (BuildContext context, double val2, Widget? child) {
                    String displayValue = val2.toStringAsFixed(2);
                    return Text(
                      '$displayValue/$marginAmount',
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
  }
}
