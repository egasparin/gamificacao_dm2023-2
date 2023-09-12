// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  Computed<bool>? _$darkModeComputed;

  @override
  bool get darkMode => (_$darkModeComputed ??=
          Computed<bool>(() => super.darkMode, name: '_SettingsStore.darkMode'))
      .value;

  late final _$_darkModeAtom =
      Atom(name: '_SettingsStore._darkMode', context: context);

  @override
  bool get _darkMode {
    _$_darkModeAtom.reportRead();
    return super._darkMode;
  }

  @override
  set _darkMode(bool value) {
    _$_darkModeAtom.reportWrite(value, super._darkMode, () {
      super._darkMode = value;
    });
  }

  late final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore', context: context);

  @override
  void toggleDarkModeStatus({bool? status}) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.toggleDarkModeStatus');
    try {
      return super.toggleDarkModeStatus(status: status);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkMode: ${darkMode}
    ''';
  }
}
