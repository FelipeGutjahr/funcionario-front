import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:funcionario_front/service/api_service.dart';
import 'package:funcionario_front/service/funcionario_service.dart';
import 'package:funcionario_front/view/lista_funcionarios_controller.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio(BaseOptions(
          baseUrl: 'http://192.168.2.116:8080',
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
        ))),
    Bind.lazySingleton((i) => ListaFuncionariosController()),
    Bind.lazySingleton((i) => ApiService(i.get())),
    Bind.lazySingleton((i) => FuncionarioService())
  ];
}
