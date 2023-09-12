import 'package:flutter/material.dart';
import '../../data/datasource/insert.dart';
import '../../data/datasource/update.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/preco.dart';
import 'widgets/numero.dart';
import '../../data/model/quarto.dart';
import 'widgets/status.dart';
import 'widgets/tipo.dart';

class QuartoForm extends StatefulWidget {
  final QuartoModel? quartoModel;

  const QuartoForm({
    Key? key,
    this.quartoModel,
  }) : super(key: key);

  @override
  QuartoFormState createState() => QuartoFormState();
}

class QuartoFormState extends State<QuartoForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  void initState() {
    if (widget.quartoModel != null) {
      _numeroController.text = widget.quartoModel!.numero;
      _precoController.text = widget.quartoModel!.preco;
      _statusController.text = widget.quartoModel!.status;
      _tipoController.text = widget.quartoModel!.tipo;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Quarto')),
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
                  NumeroQuartoField(controller: _numeroController),
                  TipoQuartoField(controller: _tipoController),
                  PrecoQuartoField(controller: _precoController),
                  StatusQuartoField(controller: _statusController),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  QuartoBotaoGravar(
                    onPressedNovo: () {
                      _numeroController.clear();
                      _tipoController.clear();
                      _precoController.clear();
                      _statusController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final QuartoModel quarto = QuartoModel(
                          numero: _numeroController.text,
                          tipo: _tipoController.text,
                          preco: _precoController.text,
                          status: _statusController.text,
                        );

                        if (widget.quartoModel == null ||
                            widget.quartoModel!.quartoId == null) {
                          // aqui tem que colocar a função de criar o quarto no banco de dados

                          /// funcao original que chama o metodo da API
                          // await QuartoInsertDataSource()
                          //     .createQuarto(quarto: quarto);

                          // nova função que usa o banco de dados local
                          await QuartoInsertDataSource().insert(quarto: quarto);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          quarto.quartoId = widget.quartoModel!.quartoId;

                          /// funcao original que chama o metodo da API
                          // await QuartoUpdateDataSource()
                          //     .updateQuarto(quarto: quarto);

                          // nova função que usa o banco de dados local
                          await QuartoUpdateDataSource()
                              .update(quartoModel: quarto);
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
