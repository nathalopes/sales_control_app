import 'package:flutter/material.dart';

void validatePassword(TextEditingController passwordController,
    BuildContext context, GlobalKey<FormState> _passwordKey) {
  if (!_passwordKey.currentState!.validate())
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Insira uma senha')));
  else if (passwordController.text == '123') {
    callHomePage(context);
  } else {
    // PRECISA SER CAPTURADA EM ALGUM LUGAR E MOSTRADA NA TELA
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Senha incorreta')));
  }
}

void callHomePage(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/home');
}
