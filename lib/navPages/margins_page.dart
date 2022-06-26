// ignore_for_file: prefer_const_constructors

import 'package:exp_margins/constants/constants.dart';
import 'package:exp_margins/models/category_model.dart';
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
        (currentData.savedCategories.length == 0)
            ? Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Begin setting up your expense margin categories by taping the (+) button',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, color: Colors.green.shade400),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: currentData.savedCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        dragDismissible: false,
                        motion: const DrawerMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: <Widget>[
                          SlidableAction(
                            onPressed: (_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewOrEditCategoryPage(
                                    isEdit: true,
                                    itemLocInd: index,
                                    preEditedName: currentData.savedCategories[index].name,
                                    preEditedColor: currentData.savedCategories[index].color,
                                    preEditedIcon: currentData.savedCategories[index].icon,
                                    preEditedMargin: currentData.savedCategories[index].marginAmount,
                                    preEditedRemaining: currentData.savedCategories[index].remainingAmount,
                                  ),
                                ),
                              );
                            },
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),
                      startActionPane: ActionPane(
                        dragDismissible: false,
                        motion: const DrawerMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: <Widget>[
                          SlidableAction(
                            onPressed: (_) {
                              currentData.savedCategories.removeAt(index);
                              currentData.notifyListeners();
                            },
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
                        marginAmount:
                            currentData.savedCategories[index].marginAmount,
                        remainingAmount:
                            currentData.savedCategories[index].remainingAmount,
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
              currentData.savedCategories.add(
                CategoryItemDataEntity(
                  name: kDefaultName,
                  color: kDefaultColor,
                  icon: kDefaultIcon,
                  marginAmount: kDefaultMargin,
                  remainingAmount: kDefaultRemaining,
                ),
              );
              print('here here here: ${currentData.savedCategories.length}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewOrEditCategoryPage(
                    itemLocInd: currentData.savedCategories.length - 1,
                  ),
                ),
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
