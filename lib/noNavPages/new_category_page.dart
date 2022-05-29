// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exp_margins/UIcomponents/category_card_ui.dart';
import 'package:exp_margins/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCategoryPage extends StatefulWidget {
  const NewCategoryPage({Key? key}) : super(key: key);

  @override
  State<NewCategoryPage> createState() => _NewCategoryPageState();
}

TextEditingController _controller = TextEditingController();
String _selectedCategoryName = 'Category Name';
Color _selectedCategoryColor = Colors.white;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          pageSectionHeader('Preview'),
          CategoryItemUI(
              cardColor: _selectedCategoryColor,
              remainingPercentage: 0.5,
              categoryIcon: Icons.account_circle_sharp,
              categoryName: _selectedCategoryName),
          pageSectionHeader('Edit'),
          nameSelectionRow(context, currentData),
          editFieldOptionsText('Icon:'),
          colorSelectionRow(context, currentData),
          editFieldOptionsText('Margin Cost:'),
          editFieldOptionsText('Remaining Budget:')
        ],
      ),
    );
  }

  //!Widet Tree end

  //?Building Block Methods

  Row nameSelectionRow(BuildContext context, DataProviding currentData) {
    return
        Row(
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
                    border: InputBorder.none),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: _controller,
                onFieldSubmitted: (value) {
                  setState(
                    () {
                      _selectedCategoryName = value;
                      _controller.clear();
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
              itemCount: currentData.availableColors.length,
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
                      color: currentData.availableColors[index],
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
