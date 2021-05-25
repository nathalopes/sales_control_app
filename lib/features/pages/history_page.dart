import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sales_control/features/widgets/cash_panel_widget.dart';
import 'package:sales_control/features/widgets/default_drawer_widget.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de atividades'),
      ),
      //
      drawer: DefaultDrawer(),
      //
      body: Column(
        children: [
          CashPanel(),
          //
          SizedBox(height: 40),
          //
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Tipo',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'R\$',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Data',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Descrição',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Motivo',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Compra')),
                      DataCell(Text('23.90')),
                      DataCell(Text('21/05/2021')),
                      DataCell(Text('6cx Leite condensado')),
                      DataCell(Text('Descrever o motivo da compra')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Venda')),
                      DataCell(Text('25.00')),
                      DataCell(Text('21/05/2021')),
                      DataCell(Text('36un sabor Morango')),
                      DataCell(Text('Descrever o motivo da compra')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Transporte')),
                      DataCell(Text('29.00')),
                      DataCell(Text('21/05/2021')),
                      DataCell(Text('Passagem GYN-BSB')),
                      DataCell(Text('Descrever o motivo da compra')),
                    ],
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
