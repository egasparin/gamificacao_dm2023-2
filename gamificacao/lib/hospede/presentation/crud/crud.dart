import 'package:flutter/material.dart';
import '../../data/datasource/insert.dart';
import '../../data/datasource/update.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/nome.dart';
import 'widgets/sobrenome.dart';
import 'widgets/documento.dart';
import 'widgets/contato.dart';

import '../../data/model/hospede.dart';

class HospedeForm extends StatefulWidget {
  final HospedeModel? hospedeModel;

  const HospedeForm({
    Key? key,
    this.hospedeModel,
  }) : super(key: key);

  @override
  HospedeFormState createState() => HospedeFormState();
}

class HospedeFormState extends State<HospedeForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _contatoController = TextEditingController();

  @override
  void initState() {
    if (widget.hospedeModel != null) {
      _nomeController.text = widget.hospedeModel!.nome;
      _sobrenomeController.text = widget.hospedeModel!.sobrenome;
      _documentoController.text = widget.hospedeModel!.documento;
      _contatoController.text = widget.hospedeModel!.contato;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Hospede')),
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
                  NomeHospedeField(controller: _nomeController),
                  SobrenomeHospedeField(controller: _sobrenomeController),
                  CargoHospedeField(controller: _documentoController),
                  SalarioHospedeField(controller: _contatoController),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  HospedeBotaoGravar(
                    onPressedNovo: () {
                      _nomeController.clear();
                      _sobrenomeController.clear();
                      _documentoController.clear();
                      _contatoController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final HospedeModel hospede = HospedeModel(
                          nome: _nomeController.text,
                          sobrenome: _sobrenomeController.text,
                          documento: _documentoController.text,
                          contato: _contatoController.text,
                        );

                        if (widget.hospedeModel == null ||
                            widget.hospedeModel!.hospedeId == null) {
                          // aqui tem que colocar a função de criar o hospede no banco de dados

                          /// funcao original que chama o metodo da API
                          // await HospedeInsertDataSource()
                          //     .createHospede(hospede: hospede);

                          // nova função que usa o banco de dados local
                          await HospedeInsertDataSource()
                              .insert(hospede: hospede);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          hospede.hospedeId = widget.hospedeModel!.hospedeId;

                          /// funcao original que chama o metodo da API
                          // await HospedeUpdateDataSource()
                          //     .updateHospede(hospede: hospede);

                          // nova função que usa o banco de dados local
                          await HospedeUpdateDataSource()
                              .update(hospedeModel: hospede);
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
