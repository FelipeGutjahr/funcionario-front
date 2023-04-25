// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_funcionarios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaFuncionariosController on _ListaFuncionariosControllerBase, Store {
  Computed<List<Funcionario>>? _$funcionariosComputed;

  @override
  List<Funcionario> get funcionarios => (_$funcionariosComputed ??=
          Computed<List<Funcionario>>(() => super.funcionarios,
              name: '_ListaFuncionariosControllerBase.funcionarios'))
      .value;

  late final _$_funcionariosAtom = Atom(
      name: '_ListaFuncionariosControllerBase._funcionarios', context: context);

  @override
  List<Funcionario> get _funcionarios {
    _$_funcionariosAtom.reportRead();
    return super._funcionarios;
  }

  @override
  set _funcionarios(List<Funcionario> value) {
    _$_funcionariosAtom.reportWrite(value, super._funcionarios, () {
      super._funcionarios = value;
    });
  }

  late final _$_ListaFuncionariosControllerBaseActionController =
      ActionController(
          name: '_ListaFuncionariosControllerBase', context: context);

  @override
  dynamic setFuncionarios(List<Funcionario> funcionarios) {
    final _$actionInfo = _$_ListaFuncionariosControllerBaseActionController
        .startAction(name: '_ListaFuncionariosControllerBase.setFuncionarios');
    try {
      return super.setFuncionarios(funcionarios);
    } finally {
      _$_ListaFuncionariosControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
funcionarios: ${funcionarios}
    ''';
  }
}
