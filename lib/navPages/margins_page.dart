// ignore_for_file: prefer_const_constructors

import 'package:exp_margins/noNavPages/new_edit_category_page.dart';
import 'package:exp_margins/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../UIcomponents/category_card_ui.dart';

class MarginsPage extends StatelessWidget {
  MarginsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentData = Provider.of<DataProviding>(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: currentData.savedCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                key: const ValueKey(0),
                startActionPane: ActionPane(
                  dragDismissible: false,
                  motion: const DrawerMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: <Widget>[
                    SlidableAction(
                      onPressed: (_) {},
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: CategoryItemUI(
                  locationIndex: index,
                  marginAmount: currentData.savedCategories[index].marginAmount,
                  remainingAmount: currentData.savedCategories[index].remainingAmount,
                  cardColor: currentData.savedCategories[index].color,
                  categoryIcon: currentData.savedCategories[index].icon,
                  categoryName: currentData.savedCategories[index].name,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewOrEditCategoryPage()),
              );
            },
            child: Container(
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.green.shade400),
            ),
          ),
        )
      ],
    );
  }
}
