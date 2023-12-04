class Cell {
  int? key;
  Cell? next;
}

class Lista {
  Cell? head;
}

class GrafoLA {
  int? vertice;
  int? aresta;
  List<Lista?>? adjacentes;
}

Lista criarLista() {
  Lista lista = Lista();
  lista.head = null;
  return lista;
}

Cell criarCelula(int key) {
  Cell novaCelula = Cell();
  novaCelula.key = key;
  novaCelula.next = null;

  return novaCelula;
}

bool isListaVazia(Lista? lista) {
  return (lista == null) || (lista.head == null);
}

bool procurar(int key, Lista? lista) {
  Cell? aux;

  if (lista != null) {
    aux = lista.head;

    while ((aux != null) && (key < aux.key!)) {
      aux = aux.next;
    }
  }

  if ((aux != null) && (key == aux.key)) {
    return true;
  } else {
    return false;
  }
}

void inserirNaLista(int key, Lista? lista) {
  Cell? auxA, auxP;
  Cell? c;

  if (isListaVazia(lista)) {
    if (lista == null) {
      lista = criarLista();
    }

    lista.head = criarCelula(key);
  } else {
    c = criarCelula(key);

    if (lista!.head!.key! >= key) {
      c.next = lista.head;

      lista.head = c;
    } else {
      auxA = lista.head!;
      auxP = auxA;

      while ((auxP != null) && (auxP.key! < key)) {
        auxA = auxP;
        auxP = auxP.next;
      }

      auxA!.next = c;
      c.next = auxP;
    }
  }
}

int removerDaLista(int key, Lista? lista) {
  Cell? auxA, auxP;

  if (!isListaVazia(lista)) {
    auxA = lista!.head;

    if (auxA!.key == key) {
      lista.head = lista.head!.next;
    } else {
      auxP = auxA;

      while ((auxA != null) && (key < auxA.key!)) {
        auxP = auxA;
        auxA = auxA.next;
      }

      if (auxA!.key == key) {
        auxP!.next = auxA.next;
      } else {
        auxA = null;
      }
    }

    return 1;
  }

  return 0;
}

void imprimir(Lista lista) {
  Cell? aux;

  if (!isListaVazia(lista)) {
    aux = lista.head;

    while (aux != null) {
      print("${aux.key}\n");

      aux = aux.next;
    }
  }
}

int liberarDaLista(Lista lista) {
  Cell aux;

  if ((lista != null) && !isListaVazia(lista)) {
    while (lista.head != null) {
      aux = lista.head!;

      lista.head = aux.next;
    }

    return 1;
  }

  return 0;
}

/***************************************************************/
// Grafo

List<Lista> iniciar_LA(int n) {
  int i;
  List<Lista> adjacentes = [];

  for (i = 0; i < n; i++) {
    adjacentes[i] = criarLista();
  }

  return adjacentes;
}

GrafoLA iniciar_grafoLA(int v) {
  GrafoLA G = GrafoLA();

  G.vertice = v;
  G.aresta = 0;
  G.adjacentes = iniciar_LA(v);

  return G;
}

bool aresta_existeLA(GrafoLA? G, int v1, int v2) {
  if ((G != null) && (G.adjacentes![v1]!.head != null)) {
    return procurar(v2, G.adjacentes![v1]);
  }

  return false;
}

void inserir_arestaLA(GrafoLA G, int v1, int v2) {
  if (!aresta_existeLA(G, v1, v2)) {
    inserirNaLista(v2, G.adjacentes![v1]);
    inserirNaLista(v1, G.adjacentes![v2]);
    G.aresta = G.aresta! + 1;
  }
}

void remover_arestaLA(GrafoLA? G, int v1, int v2) {
  if (aresta_existeLA(G, v1, v2)) {
    removerDaLista(v2, G!.adjacentes![v1]);
    removerDaLista(v1, G.adjacentes![v2]);
    G.aresta = G.aresta! - 1;
  }
}

void imprimir_arestasLA(GrafoLA? G) {
  int i;
  Cell? aux;

  if (G != null)
    for (i = 0; i < G.vertice!; i++) {
      aux = G.adjacentes![i]!.head!;

      while (aux != null) {
        print("($i, ${aux.key})\n");

        aux = aux.next!;
      }
    }
}

void liberarGLA(GrafoLA? G) {
  int i;

  if (G != null) {
    for (i = 0; i < G.vertice!; i++) {
      liberarDaLista(G.adjacentes![i]!);
    }
  }
}

void lerEntradas() {}

void main() {
  print('v d p');
}
