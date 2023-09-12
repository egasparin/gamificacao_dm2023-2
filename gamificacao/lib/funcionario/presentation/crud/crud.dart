import 'package:flutter/material.dart';
import '../../data/datasource/insert.dart';
import '../../data/datasource/update.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/nome.dart';
import 'widgets/sobrenome.dart';
import 'widgets/cargo.dart';
import 'widgets/admissao.dart';
import 'widgets/salario.dart';

import '../../data/model/funcionario.dart';

class FuncionarioForm extends StatefulWidget {
  final FuncionarioModel? funcionarioModel;

  const FuncionarioForm({
    Key? key,
    this.funcionarioModel,
  }) : super(key: key);

  @override
  FuncionarioFormState createState() => FuncionarioFormState();
}

class FuncionarioFormState extends State<FuncionarioForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();
  final TextEditingController _salarioController = TextEditingController();
  final TextEditingController _adimissaoController = TextEditingController();

  @override
  void initState() {
    if (widget.funcionarioModel != null) {
      _nomeController.text = widget.funcionarioModel!.nome;
      _sobrenomeController.text = widget.funcionarioModel!.sobrenome;
      _cargoController.text = widget.funcionarioModel!.cargo;
      _salarioController.text = widget.funcionarioModel!.salario;
      _adimissaoController.text = widget.funcionarioModel!.admissao;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Funcionario')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  NomeFuncionarioField(controller: _nomeController),
                  SobrenomeFuncionarioField(controller: _sobrenomeController),
                  CargoFuncionarioField(controller: _cargoController),
                  SalarioFuncionarioField(controller: _salarioController),
                  AdmissaoFuncionarioField(controller: _adimissaoController),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  FuncionarioBotaoGravar(
                    onPressedNovo: () {
                      _nomeController.clear();
                      _sobrenomeController.clear();
                      _cargoController.clear();
                      _salarioController.clear();
                      _adimissaoController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final FuncionarioModel funcionario = FuncionarioModel(
                          nome: _nomeController.text,
                          sobrenome: _sobrenomeController.text,
                          cargo: _cargoController.text,
                          salario: _salarioController.text,
                          admissao: _adimissaoController.text,
                        );

                        if (widget.funcionarioModel == null ||
                            widget.funcionarioModel!.funcionarioId == null) {
                          // aqui tem que colocar a função de criar o funcionario no banco de dados

                          /// funcao original que chama o metodo da API
                          // await FuncionarioInsertDataSource()
                          //     .createFuncionario(funcionario: funcionario);

                          // nova função que usa o banco de dados local
                          await FuncionarioInsertDataSource()
                              .insert(funcionario: funcionario);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          funcionario.funcionarioId =
                              widget.funcionarioModel!.funcionarioId;

                          /// funcao original que chama o metodo da API
                          // await FuncionarioUpdateDataSource()
                          //     .updateFuncionario(funcionario: funcionario);

                          // nova função que usa o banco de dados local
                          await FuncionarioUpdateDataSource()
                              .update(funcionario: funcionario);
                        }
                      }

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Usuário registrado'),
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
