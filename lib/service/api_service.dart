import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  get(endpoint, {params}) async {
    Response? response;
    try {
      response = await _dio.get(endpoint, queryParameters: params);
      // ignore: empty_catches
    } catch (e) {}
    return response;
  }

  delete(endpoint, int id) async {
    Response? response;
    try {
      response = await _dio.get(endpoint, queryParameters: {'id': id});
      // ignore: empty_catches
    } catch (e) {
      print('================== ERRO ==============');
      print(e);
    }
    return response;
  }

  post() async {
    try {
      await _dio.post('/funcionario/salvar', data: {
        'nome': 'Felipe',
        'sobrenome': 'Gutjahr',
        'email': 'gutjahrfelipe@gmail.com'
      });
    } catch (e) {
      // ignore: avoid_print
      print('OCORREU UM PROBLEMA AO FAZER A REQUISIÇÃO');
    }
  }
}
