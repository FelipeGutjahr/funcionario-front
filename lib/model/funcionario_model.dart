class Funcionario {
  int? _id;
  String? _nome;
  String? _sobrenome;
  String? _email;
  int? _pis;

  int get id => _id!;

  set id(int id) => _id = id;

  String get nome => _nome!;

  set nome(String nome) => _nome = nome;

  String get sobrenome => _sobrenome!;

  set sobrenome(String sobrenome) => _sobrenome = sobrenome;

  String get email => _email!;

  set pis(int pis) => _pis = pis;

  int get pis => _pis!;

  Funcionario.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
    _sobrenome = json['sobrenome'];
    _email = json['email'];
    _pis = json['pis'];
  }
}
