import 'package:flutter/material.dart';

import 'widgets/cash_panel_widget.dart';
import 'widgets/control_panel_widget.dart';
import 'widgets/default_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início'),
      ),
      //
      drawer: DefaultDrawer(),
      //
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              CashPanel(),
              //
              SizedBox(height: 50),
              //
              ControlPanel(),
            ],
          ),
        ),
      ),
    );
  }
}