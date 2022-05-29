import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataProviding extends ChangeNotifier {
  final List<String> categoryNames = [
    'Home',
    'Food',
    'Clothing',
    'Coffee',
    'Snacks',
    'Gas',
  ];

  final List<Color> categoryColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  final List<IconData> categoryIcons = [
    Icons.shopping_cart_outlined,
    Icons.food_bank_outlined,
    Icons.shopping_bag,
    Icons.coffee,
    Icons.fastfood_rounded,
    Icons.local_gas_station,
  ];

  final List<double> categoryPercentiles = [
    .8,
    .65,
    .85,
    .45,
    .55,
    .35,
  ];

  final List<Color> availableColors = [
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
}
