import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:funcionario_front/model/funcionario_model.dart';

import 'api_service.dart';

final apiService = Modular.get<ApiService>();

class FuncionarioService {
  Future<List<Funcionario>> listar() async {
    List<Funcionario> lista = [];
    Response res = await apiService.get('/funcionario/listar');
    res.data['result']
        .forEach((json) => {lista.add(Funcionario.fromJson(json))});
    return lista;
  }

  Future<Response> excluir(int id) async {
    return await apiService.delete('/funcionario/excluir', id);
  }
}
