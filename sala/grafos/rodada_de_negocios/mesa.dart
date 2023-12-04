import 'pessoa.dart';

class Mesa {
  List<Pessoa> pessoas;
  Mesa(this.pessoas);

  void sentarNaMesa(Pessoa novaPessoa) {
    for (var pessoa in pessoas) {
      pessoa.fazerNetworking(novaPessoa);
      novaPessoa.fazerNetworking(pessoa);
    }
    pessoas.add(novaPessoa);
  }
}
