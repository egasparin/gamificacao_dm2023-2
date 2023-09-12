import 'package:mobx/mobx.dart';

// flutter packages pub run build_runner build
part 'configuracoes.g.dart';

// ignore: library_private_types_in_public_api
class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  @observable
  bool _darkMode = false;

  @computed
  bool get darkMode => _darkMode;

  @action
  void toggleDarkModeStatus({bool? status}) {
    _darkMode = status ?? !_darkMode;
  }
}
