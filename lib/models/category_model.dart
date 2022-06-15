import 'package:flutter/material.dart';

class CategoryItemDataEntity{
  String name;
  Color color;
  IconData icon;
  double marginAmount;
  double remainingAmount;

CategoryItemDataEntity({
required this.name,
required this.color,
required this.icon,
required this.marginAmount,
required this.remainingAmount,
});
}
