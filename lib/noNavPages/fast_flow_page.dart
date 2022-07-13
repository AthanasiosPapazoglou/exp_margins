// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../UIcomponents/category_card_ui.dart';
import '../constants/constants.dart';
import '../providers/data_provider.dart';

class FastFlowChangePage extends StatefulWidget {
  const FastFlowChangePage({
    Key key,
    @required this.itemLocInd,
  }) : super(key: key);

  final int itemLocInd;

  @override
  State<FastFlowChangePage> createState() => _FastFlowChangePageState();
}

Offset triggerPoint;

class _FastFlowChangePageState extends State<FastFlowChangePage> {
  @override
  Widget build(BuildContext context) {
    final currentData = Provider.of<DataProviding>(context);

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
        body: ListView(
          children: <Widget>[
            pageSectionHeader('Preview'),
            CategoryItemUI(
              locationIndex: widget.itemLocInd,
              marginAmount:
                  currentData.savedCategories[widget.itemLocInd].marginAmount,
              remainingAmount: currentData
                  .savedCategories[widget.itemLocInd].remainingAmount,
              cardColor: currentData.savedCategories[widget.itemLocInd].color,
              categoryIcon: currentData.savedCategories[widget.itemLocInd].icon,
              categoryName: currentData.savedCategories[widget.itemLocInd].name,
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 82,
                  width: MediaQuery.of(context).size.width * .5 - 16,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Decrement Flow',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 82,
                  width: MediaQuery.of(context).size.width * .5 - 16,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Increment Flow',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Align pageSectionHeader(String title) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: TextStyle(color: Colors.green.shade400, fontSize: 20),
        ),
      ),
    );
  }
}
