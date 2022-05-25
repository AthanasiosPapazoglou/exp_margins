import 'package:exp_margins/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_menu.dart';

void main() {
  runApp(const ExpenseMargins());
}

class ExpenseMargins extends StatelessWidget {
  const ExpenseMargins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DataProviding(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
         primaryColor: Colors.green.shade400,
         scaffoldBackgroundColor: Colors.blueGrey.shade900,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade900,
            elevation: 0,
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.white,),
          ),
          body: const MainMenu(),
        ),
      ),
    );
  }
}
