import 'package:exp_margins/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataProviding extends ChangeNotifier {
  

  // final List<String> categoryNames = [
  //   'Home',
  //   'Food',
  //   'Clothing',
  //   'Coffee',
  //   'Snacks',
  //   'Gas',
  // ];

  // final List<Color> categoryColors = [
  //   Colors.red,
  //   Colors.green,
  //   Colors.blue,
  //   Colors.yellow,
  //   Colors.orange,
  //   Colors.purple,
  // ];

  // final List<IconData> categoryIcons = [
  //   Icons.shopping_cart_outlined,
  //   Icons.food_bank_outlined,
  //   Icons.shopping_bag,
  //   Icons.coffee,
  //   Icons.fastfood_rounded,
  //   Icons.local_gas_station,
  // ];

  // final List<double> marginAmountList = [
  //   150.0,
  //   120.0,
  //   90.0,
  //   110.0,
  //   175.0,
  //   55.0
  // ];

  // final List<double> remainingAmountList = [
  //   125.0,
  //   59.0,
  //   45.0,
  //   75.0,
  //   50.0,
  //   10.0
  // ];

  final List<Color> availableColors = [
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.green.shade900,
    Colors.lightBlue,
    Colors.deepOrange,
  ];

  final List<IconData> availableIcons = [
    Icons.account_circle_sharp,
    Icons.shopping_cart_outlined,
    Icons.food_bank_outlined,
    Icons.shopping_bag,
    Icons.coffee,
    Icons.fastfood_rounded,
    Icons.local_gas_station,
    Icons.accessibility_new_sharp,
    Icons.phone_android_outlined,
    Icons.local_drink_outlined,
    Icons.notes_outlined,
    Icons.account_circle_sharp,
  ];

  List<CategoryItemDataEntity> savedCategories = [
    CategoryItemDataEntity(
        name: 'Home',
        color: Colors.red,
        icon: Icons.shopping_cart_outlined,
        marginAmount: 150.0,
        remainingAmount: 125.0),
    CategoryItemDataEntity(
        name: 'Food',
        color: Colors.green,
        icon: Icons.food_bank_outlined,
        marginAmount: 110.0,
        remainingAmount: 55.0)
  ];
}
