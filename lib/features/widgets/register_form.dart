import 'package:flutter/material.dart';
import 'package:sales_control/core/repositories/database_helper.dart';
import 'package:sales_control/models/entry_validators_model.dart';
import 'package:sqflite/sqflite.dart';
import 'cash_panel_widget.dart';
import 'package:intl/intl.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _activityDescriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String inputDescription = '';
  double inputPrice = 0;
  String inputType = '';
  String _selectedType = 'Conta';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CashPanel(),
          //
          Text(
            'Selecione uma data:',
            style: TextStyle(fontSize: 20),
          ),
          //
          TextFormField(
            controller: _dateController,
            readOnly: true,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today_rounded),
              hintText: "${_selectedDate.toLocal()}".split(' ')[0],
            ),
            onTap: () {
              _selectDate(context);
            },
            validator: (value) {
              return validateTextFields(value);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          //
          SizedBox(height: 40),
          //
          TextFormField(
            controller: _activityDescriptionController,
            autofocus: true,
            onSaved: (value) => (value == null || value.isEmpty)
                ? null
                : (inputDescription = value.toString()),
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              icon: Icon(Icons.toc_rounded),
              hintText: "Descrição da atividade",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.length < 3) return 'Descrição inválida';
              return validateTextFields(value);
            },
            onChanged: (text) => print('Text: $text'),
            maxLength: 255,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          //
          SizedBox(height: 40),
          //
          TextFormField(
            controller: _priceController,
            onSaved: (value) => (value == null || value.isEmpty)
                ? null
                : inputPrice = double.parse(value.toString()),
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: "Valor R\$0,00",
              icon: Icon(Icons.attach_money_rounded),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateTextFields(value);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          //
          SizedBox(height: 40),
          //
          Text(
            "Tipo de atividade:",
            style: TextStyle(fontSize: 20),
          ),
          //
          DropdownButtonFormField<String>(
            value: _selectedType,
            onSaved: (selectedValue) =>
                (selectedValue == null || selectedValue.isEmpty)
                    ? null
                    : inputType = selectedValue,
            items: [
              'Conta',
              'Compra',
              'Transporte',
              'Venda',
              'Quitação de débitos'
            ].map<DropdownMenuItem<String>>(
              (String option) {
                return DropdownMenuItem(
                  child: Text(option),
                  value: option,
                );
              },
            ).toList(),
            onChanged: (option) {
              setState(() {
                _selectedType = option.toString();
              });
            },
            decoration: InputDecoration(
              icon: Icon(Icons.checklist_rounded),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          //
          SizedBox(height: 30),
          //
          ElevatedButton(
            child: Text(
              'Cadastrar',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: /*() {},*/
            () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                
                _query();
              }
              /*var infoToSave;

              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();

                switch (type) {
                  case 'Conta':
                    {
                      Bill bill =
                          new Bill(description, _selectedDate, price, type);
                      infoToSave = bill;
                      break;
                    }
                  case 'Compra':
                    {
                      Achievement achievement = new Achievement(
                          description, _selectedDate, price, type);
                      infoToSave = achievement;
                      break;
                    }
                  case 'Transporte':
                    {
                      TravelExpense travelExpense = new TravelExpense(
                          description, _selectedDate, price, type);
                      infoToSave = travelExpense;
                      break;
                    }
                  case 'Venda':
                    {
                      Sale sale =
                          new Sale(description, _selectedDate, price, type);
                      infoToSave = sale;
                      break;
                    }
                  case 'Quitação de débitos':
                    {
                      Payment payment =
                          new Payment(description, _selectedDate, price, type);
                      infoToSave = payment;
                      break;
                    }
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Atividade inválida')));
                }
              */

            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(350, 40))),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(_selectedDate.toString()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Selecione a data da atividade',
      cancelText: 'Cancelar',
      confirmText: 'Selecionar',
      errorFormatText: 'Formato de data inválido',
      errorInvalidText: 'Data inválida',
      fieldLabelText: 'Selecione uma data:',
    );
    if (date != null && date != _selectedDate) {
      setState(() {
        _selectedDate = date; //
      });
      _dateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  // _registerDataSqFlite({required DateTime date, required String description, required double price, required String activityType}) async {
  //   var databasesPath = await getDatabasesPath();
  //   String path = join(databasesPath, 'salesDatabase.db');
  //
  //   // open the database
  //   Database database = await openDatabase(path, version: 1,
  //       onCreate: (Database db, int version) async {
  //         // When creating the db, create the table
  //         await db.execute(
  //             'CREATE TABLE Activities(activityId INTEGER PRIMARY KEY, date DATETIME, description TEXT, price REAL, activityType TEXT)');
  //       });
  //
  //   final Uuid uuid = Uuid();
  //   final String activityId = uuid.v1(); // Create a time-based GUID
  //
  //   // Insert some records in a transaction
  //   await database.transaction((txn) async {
  //     int id1 = await txn.rawInsert(
  //         'INSERT INTO Activities(activityId, date, description, price, activityType) VALUES($activityId, $date, $description, $price, $activityType)');
  //     print('inserted1: $id1');
  //   });
  //
  //   // Get the records
  //   List<Map> list = await database.rawQuery('SELECT * FROM Activities');
  //   // List<Map> expectedList = [
  //   //   {'activityId': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
  //   //   {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
  //   // ];
  //   print(list);
  //
  //   await database.close();
  // }

  _query() async {

    // get a reference to the database
    Database? db = await DatabaseHelper.instance.database;

    // get all rows
    if (db != null) {
      List<Map> result = await db.query(DatabaseHelper.table);

      // print the results
      result.forEach((row) => print(row));
      // {_id: 1, name: Bob, age: 23}
      // {_id: 2, name: Mary, age: 32}
      // {_id: 3, name: Susan, age: 12}
    }
  }
}
