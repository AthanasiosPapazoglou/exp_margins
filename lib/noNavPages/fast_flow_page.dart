// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constants.dart';

class FastFlowChangePage extends StatefulWidget {
  const FastFlowChangePage({Key key}) : super(key: key);

  @override
  State<FastFlowChangePage> createState() => _FastFlowChangePageState();
}

Offset triggerPoint;

class _FastFlowChangePageState extends State<FastFlowChangePage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        triggerPoint = details.globalPosition;
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (triggerPoint.dx < details.globalPosition.dx - 50) {
          Navigator.pop(context);
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        triggerPoint = null;
      },
      child: Scaffold(
        backgroundColor: kThemePrimaryColor,
        appBar: AppBar(
          backgroundColor: kThemePrimaryColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kThemePrimaryColor,
              height: 30,
              width: 30,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
