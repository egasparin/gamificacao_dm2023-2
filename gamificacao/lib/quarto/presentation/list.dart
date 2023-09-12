import 'package:flutter/material.dart';

import '../../shared/widgets/drawpages.dart';
import '../../shared/widgets/mylisttile.dart';
import '../data/datasource/delete.dart';
import '../data/datasource/list.dart';
import '../data/model/quarto.dart';
import 'crud/crud.dart';

class QuartoList extends StatefulWidget {
  const QuartoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuartoPageState createState() => _QuartoPageState();
}

class _QuartoPageState extends State<QuartoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quarto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<QuartoModel>>(
          future: QuartoListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                final List<QuartoModel> quartos = snapshot.data ?? [];

                if (quartos.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhum funcionário.'),
                  );
                }

                return ListView.builder(
                  itemCount: quartos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final QuartoModel quarto = quartos[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        QuartoDeleteDataSource()
                            .delete(id: quarto.quartoId as int);
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
                                    'Remover ${quarto.numero.toUpperCase()}?'),
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
                        title: '$quarto.tipo - $quarto.numero',
                        line01Text: quarto.preco,
                        line02Text: quarto.status,
                        imageURL:
                            'https://static.thenounproject.com/png/6077227-200.png',
                        onEditPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuartoForm(
                                quartoModel: quarto,
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
            MaterialPageRoute(builder: (context) => const QuartoForm()),
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
