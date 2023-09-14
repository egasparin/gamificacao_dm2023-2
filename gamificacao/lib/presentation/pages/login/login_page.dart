import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gamificacao/initialization/initialization.dart';
import 'package:gamificacao/presentation/pages/login/stores/login_page_store.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FocusNode _emailnode = FocusNode();
  final FocusNode _passwordnode = FocusNode();
  final _loginPageStore = LoginPageStore();

  _mensagemDeErro(String mensagem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          mensagem,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }

  _onPressedAutorizarLogin({BuildContext? context}) {
    if (_loginPageStore.oFormularioEstaValido) {
      Navigator.push(
        context!,
        MaterialPageRoute(builder: (context) => const HotelApp()),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: _emailnode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_passwordnode),
              onChanged: (value) => _loginPageStore.atualizarEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), hintText: "Informe o E-mail"),
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: !_loginPageStore.emailValido,
                child: _mensagemDeErro("Utilize um E-Mail válido"),
              );
            }),
            TextField(
              focusNode: _passwordnode,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.security),
                  hintText: "Informe a senha"),
              onChanged: (value) => _loginPageStore.atualizarSenha(value),
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: !_loginPageStore.senhaValida,
                child: _mensagemDeErro("Utilize uma Senha válida"),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Observer(
                builder: (_) {
                  return ElevatedButton(
                      child: const Text('Entrar'),
                      onPressed: () =>
                          _onPressedAutorizarLogin(context: context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
