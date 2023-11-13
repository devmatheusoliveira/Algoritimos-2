class Cell {
  int? key;
  Cell? next;
}

class Lista {
  Cell? head;
}

class GrafoLA {
  int? V;
  int? a;
  List<Lista?>? adj;
}

class ObjetoGrafo {
  Lista criar_lista() {
    Lista lista = Lista();
    lista.head = null;
    return lista;
  }

  Cell criar_celula(int key) {
    Cell novaCelula = Cell();
    novaCelula.key = key;
    novaCelula.next = null;

    return novaCelula;
  }

  bool lista_is_vazia(Lista? lista) {
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

  void inserir_na_lista(int key, Lista? lista) {
    Cell? auxA, auxP;
    Cell? c;

    if (lista_is_vazia(lista)) {
      if (lista == null) {
        lista = criar_lista();
      }

      lista.head = criar_celula(key);
    } else {
      c = criar_celula(key);

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

  int remover_na_lista(int key, Lista? lista) {
    Cell? auxA, auxP;

    if (!lista_is_vazia(lista)) {
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

    if (!lista_is_vazia(lista)) {
      aux = lista.head;

      while (aux != null) {
        print("${aux.key}\n");

        aux = aux.next;
      }
    }
  }

  int liberar_lista(Lista lista) {
    Cell aux;

    if ((lista != null) && !lista_is_vazia(lista)) {
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
    List<Lista> adj = [];

    for (i = 0; i < n; i++) {
      adj[i] = criar_lista();
    }

    return adj;
  }

  GrafoLA iniciar_grafoLA(int v) {
    GrafoLA G = GrafoLA();

    G.V = v;
    G.a = 0;
    G.adj = iniciar_LA(v);

    return G;
  }

  bool aresta_existeLA(GrafoLA? G, int v1, int v2) {
    if ((G != null) && (G.adj![v1]!.head != null)) {
      return procurar(v2, G.adj![v1]);
    }

    return false;
  }

  void inserir_arestaLA(GrafoLA G, int v1, int v2) {
    if (!aresta_existeLA(G, v1, v2)) {
      inserir_na_lista(v2, G.adj![v1]);
      inserir_na_lista(v1, G.adj![v2]);
      G.a = G.a! + 1;
    }
  }

  void remover_arestaLA(GrafoLA? G, int v1, int v2) {
    if (aresta_existeLA(G, v1, v2)) {
      remover_na_lista(v2, G!.adj![v1]);
      remover_na_lista(v1, G.adj![v2]);
      G.a = G.a! - 1;
    }
  }

  void imprimir_arestasLA(GrafoLA? G) {
    int i;
    Cell aux = Cell();

    if (G != null)
      for (i = 0; i < G.V!; i++) {
        aux = G.adj![i]!.head!;

        while (aux != null) {
          print("($i, ${aux.key})\n");

          aux = aux.next!;
        }
      }
  }

  void liberarGLA(GrafoLA? G) {
    int i;

    if (G != null) {
      for (i = 0; i < G.V!; i++) {
        liberar_lista(G.adj![i]!);
      }
    }
  }
}
