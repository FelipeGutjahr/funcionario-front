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
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_ListaFuncionariosControllerBase.errorMessage'))
          .value;

  late final _$_funcionariosAtom = Atom(
      name: '_ListaFuncionariosControllerBase._funcionarios', context: context);

  @override
  ObservableList<Funcionario> get _funcionarios {
    _$_funcionariosAtom.reportRead();
    return super._funcionarios;
  }

  @override
  set _funcionarios(ObservableList<Funcionario> value) {
    _$_funcionariosAtom.reportWrite(value, super._funcionarios, () {
      super._funcionarios = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: '_ListaFuncionariosControllerBase._errorMessage', context: context);

  @override
  String get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
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
  dynamic setErrorMessage(String errorMessage) {
    final _$actionInfo = _$_ListaFuncionariosControllerBaseActionController
        .startAction(name: '_ListaFuncionariosControllerBase.setErrorMessage');
    try {
      return super.setErrorMessage(errorMessage);
    } finally {
      _$_ListaFuncionariosControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeFuncionario(int id) {
    final _$actionInfo =
        _$_ListaFuncionariosControllerBaseActionController.startAction(
            name: '_ListaFuncionariosControllerBase.removeFuncionario');
    try {
      return super.removeFuncionario(id);
    } finally {
      _$_ListaFuncionariosControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFuncionario(Funcionario funcionario) {
    final _$actionInfo = _$_ListaFuncionariosControllerBaseActionController
        .startAction(name: '_ListaFuncionariosControllerBase.addFuncionario');
    try {
      return super.addFuncionario(funcionario);
    } finally {
      _$_ListaFuncionariosControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
funcionarios: ${funcionarios},
errorMessage: ${errorMessage}
    ''';
  }
}
