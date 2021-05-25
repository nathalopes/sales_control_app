import 'package:flutter/material.dart';
import 'package:sales_control/features/widgets/default_drawer_widget.dart';
import '../widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      drawer: DefaultDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
