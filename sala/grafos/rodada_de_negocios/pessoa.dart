class Pessoa {
  String nome;
  int grau = 0;
  List<Pessoa> opcoes = [];

  Pessoa({required this.nome});

  void fazerNetworking(Pessoa pessoa) {
    if (pessoa != this && !isConhecido(pessoa)) {
      this.opcoes.add(pessoa);
      this.grau++;
    }
  }

  bool isConhecido(Pessoa pessoa) {
    for (Pessoa conhecido in this.opcoes) {
      if (conhecido == pessoa) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.nome;
  }
}
