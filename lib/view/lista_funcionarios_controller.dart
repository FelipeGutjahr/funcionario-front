import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:funcionario_front/model/funcionario_model.dart';
import 'package:funcionario_front/service/funcionario_service.dart';
import 'package:mobx/mobx.dart';

part 'lista_funcionarios_controller.g.dart';

final service = Modular.get<FuncionarioService>();

class ListaFuncionariosController = _ListaFuncionariosControllerBase
    with _$ListaFuncionariosController;

abstract class _ListaFuncionariosControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  var sobrenomeFocus = FocusNode();
  var emailFocus = FocusNode();
  var pisFocus = FocusNode();
  int id = 0;
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pisController = TextEditingController();

  @observable
  ObservableList<Funcionario> _funcionarios = ObservableList<Funcionario>();

  @observable
  String _errorMessage = '';

  @action
  setFuncionarios(List<Funcionario> funcionarios) =>
      _funcionarios.addAll(funcionarios);

  @action
  setErrorMessage(String errorMessage) => _errorMessage = errorMessage;

  @action
  removeFuncionario(int id) {
    _funcionarios.removeWhere((item) => item.id == id);
  }

  @action
  addFuncionario(Funcionario funcionario) {
    _funcionarios.add(funcionario);
  }

  @computed
  List<Funcionario> get funcionarios => _funcionarios;

  @computed
  String get errorMessage => _errorMessage;

  listarFuncionarios() async {
    setFuncionarios(await service.listar());
  }

  salvar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Funcionario funcionario = Funcionario();
      funcionario.nome = nomeController.text;
      funcionario.sobrenome = sobrenomeController.text;
      funcionario.email = emailController.text;
      if (pisController.text != '') {
        funcionario.pis = int.parse(pisController.text);
      }
      if (id != 0) {
        funcionario.id = id;
      }

      Response response = await service.salvar(funcionario);
      if (response.data['success'] == true) {
        funcionario.id = response.data['result'];
        removeFuncionario(id);
        addFuncionario(funcionario);
        limparForm();
      } else {
        setErrorMessage(response.data['message']);
      }
    }
  }

  limparForm() {
    id = 0;
    nomeController.clear();
    sobrenomeController.clear();
    emailController.clear();
    pisController.clear();
    setErrorMessage('');
  }

  excluir(int id) async {
    Response response = await service.excluir(id);
    if (response.data['success'] == true) {
      removeFuncionario(id);
    }
  }

  editar(Funcionario funcionario) {
    setErrorMessage('');
    id = funcionario.id;
    nomeController.text = funcionario.nome;
    sobrenomeController.text = funcionario.sobrenome;
    emailController.text = funcionario.email;
    if (funcionario.isPisValido) {
      pisController.text = funcionario.pis.toString();
    } else {
      pisController.text = '';
    }
  }
}
