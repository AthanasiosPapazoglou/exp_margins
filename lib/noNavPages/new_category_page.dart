// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exp_margins/UIcomponents/category_card_ui.dart';
import 'package:exp_margins/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NewCategoryPage extends StatefulWidget {
  const NewCategoryPage({Key? key}) : super(key: key);

  @override
  State<NewCategoryPage> createState() => _NewCategoryPageState();
}

TextEditingController _nameController = TextEditingController();
String _selectedCategoryName = 'Category Name';

TextEditingController _marginController = TextEditingController();
double _selectedMarginAmount = 120.00;

TextEditingController _remainingController = TextEditingController();
double _selectedRemainingAmount = 60.00;

Color _selectedCategoryColor = Colors.white;
IconData _selectedCategoryIcon = Icons.account_circle_sharp;

class _NewCategoryPageState extends State<NewCategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentData = Provider.of<DataProviding>(context);

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
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          pageSectionHeader('Preview'),
          CategoryItemUI(
              marginAmount: _selectedMarginAmount,
              remainingAmount: _selectedRemainingAmount,
              cardColor: _selectedCategoryColor,
              categoryIcon: _selectedCategoryIcon,
              categoryName: _selectedCategoryName),
          pageSectionHeader('Edit'),
          nameSelectionRow(context, currentData),
          iconSelectionRow(context, currentData),
          colorSelectionRow(context, currentData),
          marginSelectionRow(context, currentData),
          remainingSelectionRow(context, currentData),
          (_selectedCategoryName != null 
          && _selectedCategoryName != ''
          && _selectedCategoryName != 'Category Name'
          && _selectedMarginAmount >= _selectedRemainingAmount)
          ? Center(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                height: 48,
                width: MediaQuery.of(context).size.width * .4,
                child: Center(
                  child: Text('+ Add Expense',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),),
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(20)
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
                  child: Text('+ Add Expense',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
          )
        ],
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
                      _selectedRemainingAmount = double.parse(value);
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
                      _selectedMarginAmount = double.parse(value);
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
                        _selectedCategoryIcon =
                            currentData.availableIcons[index];
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Icon(currentData.availableIcons[index]),
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
                    border: InputBorder.none,),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: _nameController,
                onFieldSubmitted: (value) {
                  setState(
                    () {
                      _selectedCategoryName = value;
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
                        _selectedCategoryColor =
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
                        color: currentData.availableColors[index],
                        borderRadius: BorderRadius.circular(90)
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
