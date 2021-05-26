import 'package:flutter/material.dart';
import 'package:sales_control/features/pages/test_page.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Página inicial'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            title: Text('Cadastrar nova atividade'),
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          ListTile(
            title: Text('Trocar senha de acesso'),
            onTap: () {
              Navigator.pushNamed(context, '/change_password');
            },
          ),
          ListTile(
            title: Text('Página de testes'),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new TestPage()),
              );
            },
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
    );
  }
}
