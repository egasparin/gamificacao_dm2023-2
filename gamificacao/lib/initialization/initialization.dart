import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../adicionais/presentation/list.dart';
import '../hospede/presentation/list.dart';
import '../quarto/presentation/list.dart';
import '../funcionario/presentation/list.dart';
import '../reserva/presentation/list.dart';

// import 'package:flutter_modular/flutter_modular.dart';
// import '/settings/presentation/mobx/configuracoes.dart';
// import '../shared/functions/dark_mode_control.dart';

import '../settings/presentation/configuracoes.dart';

// ignore: must_be_immutable
class HotelApp extends StatelessWidget {
  // late SettingsStore _settingsStore;

  const HotelApp({super.key});

  // desativei as configuracoes de tema pois estava retornando erro
  // temos que ver como fazer uso do shared preferences
  @override
  Widget build(BuildContext context) {
    // _settingsStore = Modular.get<SettingsStore>();
    // getDarkMode().then((darkMode) {
    //   _settingsStore.toggleDarkModeStatus(status: darkMode);
    // });

    return Observer(builder: (context) {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const FuncionarioList(),
          '/adicionais': (context) => const AdicionaisList(),
          '/funcionario': (context) => const FuncionarioList(),
          '/hospede': (context) => const HospedeList(),
          '/quarto': (context) => const QuartoList(),
          '/reserva': (context) => const ReservaList(),
          '/configuracao': (context) => const SettingsPage(),
        },
        // theme: _settingsStore.darkMode ? ThemeData.dark() : ThemeData.light(),
      );
    });
  }
}
