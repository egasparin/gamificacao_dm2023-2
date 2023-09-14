// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageStore on _LoginPageStore, Store {
  Computed<bool>? _$emailValidoComputed;

  @override
  bool get emailValido =>
      (_$emailValidoComputed ??= Computed<bool>(() => super.emailValido,
              name: '_LoginPageStore.emailValido'))
          .value;
  Computed<bool>? _$senhaValidaComputed;

  @override
  bool get senhaValida =>
      (_$senhaValidaComputed ??= Computed<bool>(() => super.senhaValida,
              name: '_LoginPageStore.senhaValida'))
          .value;
  Computed<bool>? _$oFormularioEstaValidoComputed;

  @override
  bool get oFormularioEstaValido => (_$oFormularioEstaValidoComputed ??=
          Computed<bool>(() => super.oFormularioEstaValido,
              name: '_LoginPageStore.oFormularioEstaValido'))
      .value;

  late final _$emailAtom =
      Atom(name: '_LoginPageStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_LoginPageStore.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$_LoginPageStoreActionController =
      ActionController(name: '_LoginPageStore', context: context);

  @override
  dynamic atualizarEmail(String novoEmail) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction(
        name: '_LoginPageStore.atualizarEmail');
    try {
      return super.atualizarEmail(novoEmail);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarSenha(String novaSenha) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction(
        name: '_LoginPageStore.atualizarSenha');
    try {
      return super.atualizarSenha(novaSenha);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
emailValido: ${emailValido},
senhaValida: ${senhaValida},
oFormularioEstaValido: ${oFormularioEstaValido}
    ''';
  }
}
