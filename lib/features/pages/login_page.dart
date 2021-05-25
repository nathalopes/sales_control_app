import 'package:flutter/material.dart';
import 'package:sales_control/models/login_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();
  final _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _passwordKey,
          child: ListView(
            children: [
              SizedBox(height: 40),
              //
              SizedBox(
                child: Image.asset('assets/images/dollar.png'),
                height: 300,
              ),
              //
              SizedBox(height: 80),
              //
              TextFormField(
                decoration: InputDecoration(hintText: 'Insira a senha'),
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Insira uma senha';
                  else
                    return null;
                },
                obscureText: true,
              ),
              //
              SizedBox(height: 100),
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton(
                  onPressed: () {
                    validatePassword(passwordController, context, _passwordKey);
                  },
                  child: Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
