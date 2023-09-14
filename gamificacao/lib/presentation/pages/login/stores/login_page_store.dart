// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'login_page_store.g.dart';

class LoginPageStore = _LoginPageStore with _$LoginPageStore;

abstract class _LoginPageStore with Store {
  @observable
  String email = '';

  @observable
  String senha = '';

  @computed
  bool get emailValido {
    if (email.trim().isEmpty) {
      return false;
    }

    Pattern pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    
    final RegExp regex = RegExp(pattern.toString());

    return regex.hasMatch(email);
  }

  @computed
  bool get senhaValida => senha.trim().isNotEmpty;

  @computed
  bool get oFormularioEstaValido => emailValido && senhaValida;

  @action
  atualizarEmail(String novoEmail) => email = novoEmail;

  @action
  atualizarSenha(String novaSenha) => senha = novaSenha;

}
