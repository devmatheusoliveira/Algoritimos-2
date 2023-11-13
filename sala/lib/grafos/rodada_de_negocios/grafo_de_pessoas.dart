import 'package:sala/grafos/rodada_de_negocios/pessoa.dart';

class GrafoDePessoas {
  void conversa(List<Pessoa> mesa) {
    for (Pessoa pessoa in mesa) {
      for (Pessoa outraPessoa in mesa) {
        if (pessoa != outraPessoa) {
          outraPessoa.fazerNetworking(pessoa);
          pessoa.fazerNetworking(outraPessoa);
        }
      }
    }
  }
}
