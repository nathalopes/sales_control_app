import 'package:flutter/material.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(300, 80),
            ),
          ),
          child: Text("Cadastrar nova atividade"),
        ),
        //
        SizedBox(
          height: 100,
        ),
        //
        ElevatedButton(
          child: Text("Ver atividades"),
          onPressed: () {
            Navigator.pushNamed(context, '/history');
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(300, 80),
            ),
          ),
        ),
        //
      ],
    );
  }
}
