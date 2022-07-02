// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exp_margins/UIcomponents/category_card_ui.dart';
import 'package:exp_margins/constants/constants.dart';
import 'package:exp_margins/models/category_model.dart';
import 'package:exp_margins/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NewOrEditCategoryPage extends StatefulWidget {
  const NewOrEditCategoryPage(
      {Key key,
      this.isEdit = false,
      this.itemLocInd = -1,
      this.preEditedName = kDefaultName,
      this.preEditedColor = kDefaultColor,
      this.preEditedIcon = kDefaultIcon,
      this.preEditedMargin = kDefaultMargin,
      this.preEditedRemaining = kDefaultRemaining})
      : super(key: key);

  final bool isEdit;
  final int itemLocInd;
  final String preEditedName;
  final Color preEditedColor;
  final IconData preEditedIcon;
  final double preEditedMargin;
  final double preEditedRemaining;

  @override
  State<NewOrEditCategoryPage> createState() => _NewOrEditCategoryPageState();
}

TextEditingController _nameController = TextEditingController();

TextEditingController _marginController = TextEditingController();

TextEditingController _remainingController = TextEditingController();

class _NewOrEditCategoryPageState extends State<NewOrEditCategoryPage> {
  Offset triggerPoint;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //   super.dispose();
    //   _nameController.dispose();
    //   _marginController.dispose();
    //   _remainingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentData = Provider.of<DataProviding>(context);

    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        print('Start');
        triggerPoint = details.globalPosition;
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        print(details.globalPosition);
        if (triggerPoint.dx < details.globalPosition.dx - 50) {
          Navigator.pop(context);
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        print('End');
        triggerPoint = null;
      },
      child: Scaffold(
        backgroundColor: kThemePrimaryColor,
        appBar: AppBar(
          backgroundColor: kThemePrimaryColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              if (!widget.isEdit) {
                currentData.savedCategories.removeLast();
              } else {
                currentData.savedCategories[widget.itemLocInd].name =
                    widget.preEditedName;
                currentData.savedCategories[widget.itemLocInd].color =
                    widget.preEditedColor;
                currentData.savedCategories[widget.itemLocInd].icon =
                    widget.preEditedIcon;
                currentData.savedCategories[widget.itemLocInd].marginAmount =
                    widget.preEditedMargin;
                currentData.savedCategories[widget.itemLocInd].remainingAmount =
                    widget.preEditedRemaining;
              }
              currentData.notifyListeners();
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
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            pageSectionHeader('Preview'),
            CategoryItemUI(
              locationIndex: widget.itemLocInd,
              marginAmount:
                  currentData.savedCategories[widget.itemLocInd].marginAmount,
              remainingAmount:
                  currentData.savedCategories[widget.itemLocInd].remainingAmount,
              cardColor: currentData.savedCategories[widget.itemLocInd].color,
              categoryIcon: currentData.savedCategories[widget.itemLocInd].icon,
              categoryName: currentData.savedCategories[widget.itemLocInd].name,
            ),
            pageSectionHeader('Edit'),
            nameSelectionRow(context, currentData),
            iconSelectionRow(context, currentData),
            colorSelectionRow(context, currentData),
            marginSelectionRow(context, currentData),
            remainingSelectionRow(context, currentData),
            (currentData.savedCategories[widget.itemLocInd].name != null &&
                    currentData.savedCategories[widget.itemLocInd].name != '' &&
                    currentData.savedCategories[widget.itemLocInd].name !=
                        'Category Name' &&
                    currentData.savedCategories[widget.itemLocInd].marginAmount >=
                        currentData
                            .savedCategories[widget.itemLocInd].remainingAmount)
                ? GestureDetector(
                    onTap: () {
                      currentData.notifyListeners();
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Center(
                            child: Text(
                              (!widget.isEdit)
                                  ? '+ Add Expense'
                                  : 'Save & Return',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green.shade400,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Center(
                          child: Text(
                            '+ Add Expense',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  //!Widet Tree end

  //?Building Block Methods

  Row remainingSelectionRow(BuildContext context, DataProviding currentData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        editFieldOptionsText('Remaining Budget:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(16, 6, 16, 6),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: '€/\$/£',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: _remainingController,
                onFieldSubmitted: (value) {
                  setState(
                    () {
                      currentData.savedCategories[widget.itemLocInd]
                          .remainingAmount = double.parse(value);
                      _remainingController.clear();
                    },
                  );
                },
              ),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.3),
        ),
      ],
    );
  }

  Row marginSelectionRow(BuildContext context, DataProviding currentData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        editFieldOptionsText('Margin Cost:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(16, 6, 16, 6),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: '€/\$/£',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: _marginController,
                onFieldSubmitted: (value) {
                  setState(
                    () {
                      currentData.savedCategories[widget.itemLocInd]
                          .marginAmount = double.parse(value);
                      _marginController.clear();
                    },
                  );
                },
              ),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.3),
        )
      ],
    );
  }

  Row iconSelectionRow(BuildContext context, DataProviding currentData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        editFieldOptionsText('Icon:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentData.availableIcons.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        currentData.savedCategories[widget.itemLocInd].icon =
                            currentData.availableIcons[index];
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Icon(
                        currentData.availableIcons[index],
                        color: (currentData.availableIcons[index] ==
                                currentData
                                    .savedCategories[widget.itemLocInd].icon)
                            ? Colors.green.shade400
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Row nameSelectionRow(BuildContext context, DataProviding currentData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        editFieldOptionsText('Name:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(16, 6, 16, 6),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Give a category name:',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: _nameController,
                onFieldSubmitted: (value) {
                  setState(
                    () {
                      currentData.savedCategories[widget.itemLocInd].name =
                          value;
                      _nameController.clear();
                    },
                  );
                },
              ),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.6),
        )
      ],
    );
  }

  Row colorSelectionRow(BuildContext context, DataProviding currentData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        editFieldOptionsText('Color:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentData.availableIcons.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        currentData.savedCategories[widget.itemLocInd].color =
                            currentData.availableColors[index];
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: (currentData.availableColors[index] ==
                                  currentData
                                      .savedCategories[widget.itemLocInd].color)
                              ? Border.all(color: Colors.black, width: 2)
                              : null,
                          color: currentData.availableColors[index],
                          borderRadius: BorderRadius.circular(90)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
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

  Padding editFieldOptionsText(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 22, 16, 22),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.green.shade400,
          fontSize: 23,
        ),
      ),
    );
  }
}
