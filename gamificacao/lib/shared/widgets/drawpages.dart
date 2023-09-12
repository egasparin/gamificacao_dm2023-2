import 'package:flutter/material.dart';

class DrawerPage {
  static Widget getWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Adicionais'),
            onTap: () {
              Navigator.of(context).pushNamed('/adicionais');
            },
          ),
          ListTile(
            title: const Text('Funcionario'),
            onTap: () {
              Navigator.of(context).pushNamed('/funcionario');
            },
          ),
          ListTile(
            title: const Text('Hospedes'),
            onTap: () {
              Navigator.of(context).pushNamed('/hospede');
            },
          ),
          ListTile(
            title: const Text('Quartos'),
            onTap: () {
              Navigator.of(context).pushNamed('/quarto');
            },
          ),
          ListTile(
            title: const Text('Reservas'),
            onTap: () {
              Navigator.of(context).pushNamed('/reserva');
            },
          ),
          // ListTile(
          //   title: const Text('Configurações'),
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/configuracao');
          //   },
          // ),
        ],
      ),
    );
  }
}
