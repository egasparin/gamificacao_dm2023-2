import 'package:flutter/material.dart';
import 'package:gamificacao/hospede/data/datasource/list.dart';
import 'package:gamificacao/hospede/data/model/hospede.dart';
import 'package:gamificacao/quarto/data/datasource/list.dart';
import 'package:gamificacao/quarto/data/model/quarto.dart';
import '../../data/datasource/insert.dart';
import '../../data/datasource/update.dart';
import 'widgets/botao_gravar.dart';
import '../../data/model/reserva.dart';
import 'widgets/data_entrada.dart';
import 'widgets/data_saida.dart';

class ReservaForm extends StatefulWidget {
  final ReservaModel? reservaModel;

  const ReservaForm({
    Key? key,
    this.reservaModel,
  }) : super(key: key);

  @override
  ReservaFormState createState() => ReservaFormState();
}

class ReservaFormState extends State<ReservaForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _entradaController = TextEditingController();
  final TextEditingController _saidaController = TextEditingController();
  List _hospedes = [];
  List<HospedeModel> _hospedesResgatados = [];
  List _quartos = [];
  List<QuartoModel> _quartosResgatados = [];

  @override
  void initState() {
    if (widget.reservaModel != null) {
      _entradaController.text = widget.reservaModel!.dataEntrada;
      _saidaController.text = widget.reservaModel!.dataSaida;
      _hospedes = widget.reservaModel!.hospedes;
      _quartos = widget.reservaModel!.quartos;
    }

    _resgatarHospedes();
    _resgatarQuartos();

    super.initState();
  }

  Future<void> _resgatarHospedes() async {
    final hospedes = await HospedeListDataSource().getAll();

    setState(() {
      _hospedesResgatados = hospedes;
    });
  }

  Future<void> _resgatarQuartos() async {
    final quartos = await QuartoListDataSource().getAll();

    setState(() {
      _quartosResgatados = quartos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Reserva')),
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
                  EntradaReservaField(controller: _entradaController),
                  SaidaReservaField(controller: _saidaController),

                  // listagem dos hospedes
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selecione a o hospede:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: _hospedesResgatados.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nenhuma hospede cadastrado',
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _hospedesResgatados.length,
                            itemBuilder: (BuildContext context, int index) {
                              final HospedeModel hospede =
                                  _hospedesResgatados[index];

                              final bool isSelected =
                                  _hospedes.contains(hospede.hospedeId);

                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      hospede.nomeCompleto,
                                      style: TextStyle(
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected ? Colors.blue : null,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _hospedes.remove(hospede.hospedeId);
                                        } else {
                                          _hospedes.add(hospede.hospedeId);
                                        }
                                      });
                                    },
                                    tileColor: isSelected
                                        ? Colors.blue.withOpacity(0.5)
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  //listagem dos quartos

                  // listagem dos hospedes
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selecione o quarto:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: _quartosResgatados.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nenhuma quarto cadastrado',
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _quartosResgatados.length,
                            itemBuilder: (BuildContext context, int index) {
                              final QuartoModel quarto =
                                  _quartosResgatados[index];

                              final bool isSelected =
                                  _quartos.contains(quarto.quartoId);

                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      quarto.numeroTipo,
                                      style: TextStyle(
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected ? Colors.blue : null,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _quartos.remove(quarto.quartoId);
                                        } else {
                                          _quartos.add(quarto.quartoId);
                                        }
                                      });
                                    },
                                    tileColor: isSelected
                                        ? Colors.blue.withOpacity(0.5)
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),

                  ReservaBotaoGravar(
                    onPressedNovo: () {
                      _entradaController.clear();
                      _saidaController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final ReservaModel reserva = ReservaModel(
                          dataEntrada: _entradaController.text,
                          dataSaida: _saidaController.text,
                          hospedes: _hospedes,
                          quartos: _quartos,
                        );

                        if (widget.reservaModel == null ||
                            widget.reservaModel!.reservaId == null) {
                          // aqui tem que colocar a função de criar o reserva no banco de dados

                          /// funcao original que chama o metodo da API
                          // await ReservaInsertDataSource()
                          //     .createReserva(reserva: reserva);

                          // nova função que usa o banco de dados local
                          await ReservaInsertDataSource()
                              .insert(reserva: reserva);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          reserva.reservaId = widget.reservaModel!.reservaId;

                          /// funcao original que chama o metodo da API
                          // await ReservaUpdateDataSource()
                          //     .updateReserva(reserva: reserva);

                          // nova função que usa o banco de dados local
                          await ReservaUpdateDataSource()
                              .update(reservaModel: reserva);
                        }
                      }

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Reserva registrada'),
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
