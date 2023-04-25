import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:funcionario_front/model/funcionario_model.dart';
import 'package:funcionario_front/view/lista_funcionarios_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final controller = Modular.get<ListaFuncionariosController>();

class ListaFuncionariosView extends StatefulWidget {
  const ListaFuncionariosView({super.key});

  @override
  State<ListaFuncionariosView> createState() => _ListaFuncionariosView();
}

class _ListaFuncionariosView extends State<ListaFuncionariosView> {
  @override
  void initState() {
    controller.listarFuncionarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Funcionários'),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: controller.funcionarios.length,
            itemBuilder: (context, index) {
              Funcionario funcionario = controller.funcionarios[index];
              return ListTile(
                title: Text("${funcionario.nome} ${funcionario.sobrenome}"),
                subtitle: Text(funcionario.email),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_forever),
                  onPressed: () => controller.excluir(funcionario.id),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.only(
                      bottom: 4, left: 12, right: 12, top: 18),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 18),
                      const Text('Novo funcionário',
                          style: TextStyle(fontSize: 18)),
                      TextFormField(
                        autofocus: true,
                      ),
                      TextFormField(),
                      TextFormField(),
                      TextFormField(),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
