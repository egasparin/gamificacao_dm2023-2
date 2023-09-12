import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'mobx/configuracoes.dart';

// ignore: must_be_immutable
class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  // String _language = 'Português';

  @override
  Widget build(BuildContext context) {
    final SettingsStore settingsStore = Modular.get<SettingsStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferências',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Modo escuro'),
                const Spacer(),
                Switch(
                  value: settingsStore.darkMode,
                  onChanged: (value) {
                    settingsStore.toggleDarkModeStatus();
                    // setDarkModeStatus(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
