import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:funcionario_front/component/input/input.dart';
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
                onTap: () => {
                  controller.editar(funcionario),
                  _showModal(),
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete_forever),
                  onPressed: () => controller.excluir(funcionario.id),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () => {
          controller.limparForm(),
          _showModal(),
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showModal() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 18),
                  Text(
                    controller.id == 0
                        ? 'Novo funcionário'
                        : 'Editar funcionário',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Observer(builder: (_) {
                    return controller.errorMessage != ''
                        ? Text(controller.errorMessage,
                            style: const TextStyle(color: Colors.red))
                        : Container();
                  }),
                  const SizedBox(height: 18),
                  Input(
                    hintText: 'Nome',
                    controller: controller.nomeController,
                    required: true,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(controller.sobrenomeFocus),
                  ),
                  const SizedBox(height: 8),
                  Input(
                    hintText: 'Sobrenome',
                    controller: controller.sobrenomeController,
                    required: true,
                    focusNode: controller.sobrenomeFocus,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(controller.emailFocus),
                  ),
                  const SizedBox(height: 8),
                  Input(
                    hintText: 'Email',
                    controller: controller.emailController,
                    required: true,
                    focusNode: controller.emailFocus,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(controller.pisFocus),
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8),
                  Input(
                    hintText: 'NIS (PIS)',
                    controller: controller.pisController,
                    focusNode: controller.pisFocus,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text('SALVAR'),
                    onPressed: () {
                      controller.salvar(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
