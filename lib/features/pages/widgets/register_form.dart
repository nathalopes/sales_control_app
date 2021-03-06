import 'package:flutter/material.dart';
import 'package:sales_control/features/validators/input_validator.dart';
import 'cash_panel_widget.dart';
import 'package:intl/intl.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
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
            controller: _descriptionController,
            autofocus: true,
            onSaved: (value) => (value == null || value.isEmpty)
                ? null
                : (_descriptionController.text = value.toString()),
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
                : _priceController.text = value.toString(),
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

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processando os dados')));
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
      initialDate: _selectedDate,//DateTime.parse(_selectedDate.toString()),
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
        _selectedDate = date;
      });
      _dateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
