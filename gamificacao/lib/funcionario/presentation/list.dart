import 'package:flutter/material.dart';
import '../data/datasource/delete.dart';
import '../data/datasource/list.dart';
import '../../shared/widgets/drawpages.dart';
import '../../shared/widgets/mylisttile.dart';
import '../data/model/funcionario.dart';
import 'crud/crud.dart';

class FuncionarioList extends StatefulWidget {
  const FuncionarioList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<FuncionarioModel>>(
          future: FuncionarioListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                final List<FuncionarioModel> funcionarios = snapshot.data ?? [];

                if (funcionarios.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhum funcionário.'),
                  );
                }

                return ListView.builder(
                  itemCount: funcionarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    final FuncionarioModel funcionario = funcionarios[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        FuncionarioDeleteDataSource()
                            .delete(id: funcionario.funcionarioId as int);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            showCloseIcon: true,
                            closeIconColor: Colors.white,
                            backgroundColor: Colors.indigo,
                            content: Text(
                              'Remoção bem sucedida',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      confirmDismiss: (direction) async {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Confirma remover?'),
                                content: Text(
                                    'Remover ${funcionario.nome.toUpperCase()}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Remover',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                      key: Key('$index'),
                      child: MyListTile(
                        isOdd: index.isOdd,
                        title: funcionario.nomeCompleto,
                        line01Text: funcionario.cargo,
                        line02Text: funcionario.salario,
                        imageURL:
                            'https://static.thenounproject.com/png/6077227-200.png',
                        onEditPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FuncionarioForm(
                                funcionarioModel: funcionario,
                              ),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                    );
                  },
                );
              default:
                return Container(
                  color: Colors.red,
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FuncionarioForm()),
          );
          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
