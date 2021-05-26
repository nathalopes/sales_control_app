import 'package:flutter/material.dart';

class CashPanel extends StatefulWidget {
  @override
  _CashPanelState createState() => _CashPanelState();
}

class _CashPanelState extends State<CashPanel> {
  var cash = 200.00;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        children: [
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'SALDO',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontFamily: 'KoHo',
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'R\$',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                    ),
                  ),
                  Text(
                    cash.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
