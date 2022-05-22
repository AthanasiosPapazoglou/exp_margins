import 'package:flutter/material.dart';

import 'main_menu.dart';

void main() {
  runApp(const ExpenseMargins());
}

class ExpenseMargins extends StatelessWidget {
  const ExpenseMargins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
      
       primaryColor: Colors.green.shade400,
       scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,),
        ),
        body: const MainMenu(),
      ),
    );
  }
}
