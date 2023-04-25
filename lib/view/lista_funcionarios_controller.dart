import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:funcionario_front/model/funcionario_model.dart';
import 'package:funcionario_front/service/funcionario_service.dart';
import 'package:mobx/mobx.dart';

part 'lista_funcionarios_controller.g.dart';

final service = Modular.get<FuncionarioService>();

class ListaFuncionariosController = _ListaFuncionariosControllerBase
    with _$ListaFuncionariosController;

abstract class _ListaFuncionariosControllerBase with Store {
  @observable
  List<Funcionario> _funcionarios = [];

  @action
  setFuncionarios(List<Funcionario> funcionarios) =>
      _funcionarios = funcionarios;

  @computed
  List<Funcionario> get funcionarios => _funcionarios;

  @action
  removeItem(int id) {
    _funcionarios.removeWhere((item) => item.id == id);
  }

  listarFuncionarios() async {
    setFuncionarios(await service.listar());
  }

  salvar() {
    // ignore: avoid_print
    // apiService.post();
  }

  excluir(int id) async {
    Response response = await service.excluir(id);
    if (response.data['result']) {
      removeItem(id);
    }
  }
}
