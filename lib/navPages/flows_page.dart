// ignore_for_file: prefer_const_constructors

import 'package:exp_margins/UIcomponents/stock_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlowsPage extends StatelessWidget {
  const FlowsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: StockAppBar(text: 'Flows'),
          ),
      body: Center(
        child: Text(
          'Flows Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
