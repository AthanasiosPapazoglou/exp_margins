// ignore_for_file: prefer_const_constructors

import 'package:exp_margins/UIcomponents/stock_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: StockAppBar(text: 'Statistics'),
          ),
      body: Center(
        child: Text(
          'Statistics Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
