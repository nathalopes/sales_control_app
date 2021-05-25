import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            //
            Text(
              'Senha antiga',
              style: TextStyle(
                fontFamily: 'KoHo',
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            //
            SizedBox(height: 50),
            //
            Text(
              'Nova senha',
              style: TextStyle(
                fontFamily: 'KoHo',
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            //
            SizedBox(height: 50),
            //
            Text(
              'Repita a nova senha',
              style: TextStyle(
                fontFamily: 'KoHo',
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Salvar nova senha'),
                ),
                OutlinedButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    // Clean every text user have entered
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
