import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String texto;
  final TextInputType tipoDeInput;
  final Color corDoCursor;
  final int tamanhoDaFonte;
  final bool habilitarCorretor;
  final bool habilitarSugestoes;
  final bool habilitarTextoObscuro;

  const TextInput(
      {required Key key,
      required this.texto,
      required this.tipoDeInput,
      required this.corDoCursor,
      required this.tamanhoDaFonte,
      required this.habilitarCorretor,
      required this.habilitarSugestoes,
      required this.habilitarTextoObscuro})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: texto,
          fillColor: Colors.white.withOpacity(0.7),
          filled: true,
          border: InputBorder.none),
      autocorrect: habilitarCorretor,
      enableSuggestions: habilitarSugestoes,
      obscureText: habilitarTextoObscuro,
      keyboardType: tipoDeInput,
      cursorColor: corDoCursor,
      style: TextStyle(fontSize: tamanhoDaFonte.toDouble()),
    );
  }
}
