// ignore_for_file: prefer_const_constructors

import 'package:exp_margins/noNavPages/new_category_page.dart';
import 'package:exp_margins/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

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
            itemCount: currentData.categoryNames.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryItemUI(
                cardColor: currentData.categoryColors[index],
                remainingPercentage: currentData.categoryPercentiles[index],
                categoryIcon: currentData.categoryIcons[index],
                categoryName: currentData.categoryNames[index],
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
                    builder: (context) => const NewCategoryPage()),
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
