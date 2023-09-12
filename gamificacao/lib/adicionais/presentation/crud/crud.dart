import 'package:flutter/material.dart';
import '../../data/datasource/insert.dart';
import '../../data/datasource/update.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/preco.dart';
import 'widgets/descricao.dart';
import '../../data/model/adicionais.dart';

class AdicionaisForm extends StatefulWidget {
  final AdicionaisModel? adicionaisModel;

  const AdicionaisForm({
    Key? key,
    this.adicionaisModel,
  }) : super(key: key);

  @override
  AdicionaisFormState createState() => AdicionaisFormState();
}

class AdicionaisFormState extends State<AdicionaisForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  void initState() {
    if (widget.adicionaisModel != null) {
      _descricaoController.text = widget.adicionaisModel!.descricao;
      _precoController.text = widget.adicionaisModel!.preco;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Adicionais')),
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
                  DescricaoAdicionaisField(controller: _descricaoController),
                  PrecoAdicionaisField(controller: _precoController),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  AdicionaisBotaoGravar(
                    onPressedNovo: () {
                      _descricaoController.clear();
                      _precoController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final AdicionaisModel adicionais = AdicionaisModel(
                          descricao: _descricaoController.text,
                          preco: _precoController.text,
                        );

                        if (widget.adicionaisModel == null ||
                            widget.adicionaisModel!.adicionaisId == null) {
                          // aqui tem que colocar a função de criar o adicionais no banco de dados

                          /// funcao original que chama o metodo da API
                          // await AdicionaisInsertDataSource()
                          //     .createAdicionais(adicionais: adicionais);

                          // nova função que usa o banco de dados local
                          await AdicionaisInsertDataSource()
                              .insert(adicionais: adicionais);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          adicionais.adicionaisId =
                              widget.adicionaisModel!.adicionaisId;

                          /// funcao original que chama o metodo da API
                          // await AdicionaisUpdateDataSource()
                          //     .updateAdicionais(adicionais: adicionais);

                          // nova função que usa o banco de dados local
                          await AdicionaisUpdateDataSource()
                              .update(adicionais: adicionais);
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
