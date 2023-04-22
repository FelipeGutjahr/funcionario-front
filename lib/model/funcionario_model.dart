class Funcionario {
  int? _id;
  String? _nome;
  String? _sobrenome;
  String? _email;
  int? _pis;

  Funcionario();

  int get id => _id!;

  set id(int id) => _id = id;

  String get nome => _nome!;

  set nome(String nome) => _nome = nome;

  String get sobrenome => _sobrenome!;

  set sobrenome(String sobrenome) => _sobrenome = sobrenome;

  String get email => _email!;

  set email(String email) => _email = email;

  int get pis => _pis!;

  set pis(int pis) => _pis = pis;

  bool get isPisValido => _pis != null;

  Funcionario.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
    _sobrenome = json['sobrenome'];
    _email = json['email'];
    _pis = json['pis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['nome'] = _nome;
    data['sobrenome'] = _sobrenome;
    data['email'] = _email;
    data['pis'] = _pis;
    return data;
  }
}
