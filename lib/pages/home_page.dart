import 'package:flutter/material.dart';

import '../models/tarefa.dart';

// =============================================================================
// TELA: HomePage
// -----------------------------------------------------------------------------
// Tela principal: mostra a lista de tarefas e permite marcar e adicionar.
// =============================================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // Cria o objeto de estado ligado a este widget.
  // `=>` é um atalho para `{ return _HomePageState(); }`.
  @override
  State<HomePage> createState() => _HomePageState();
}

// O `_` no início do nome deixa a classe PRIVADA (visível só neste arquivo).
class _HomePageState extends State<HomePage> {
  // ---------------------------------------------------------------------------
  // ESTADO
  // ---------------------------------------------------------------------------

  // Lista de tarefas exibida na tela.
  // - `List<Tarefa>` → lista que só aceita objetos do tipo Tarefa.
  // - `final` → a variável sempre aponta para ESTA lista, mas o conteúdo dela
  final List<Tarefa> tarefas = [
    Tarefa('Estudar Dart'),
    Tarefa('Aprender Flutter'),
    Tarefa('Criar meu aplicativo'),
  ];

  // ---------------------------------------------------------------------------
  // AÇÕES
  // ---------------------------------------------------------------------------

  // Marca ou desmarca uma tarefa.
  //
  // O setState avisa o Flutter que os dados mudaram, e ele chama o build()
  // de novo para redesenhar a tela. Toda mudança em dados que aparecem na tela
  // deve ficar DENTRO de um setState.
  void _alternarTarefa(Tarefa tarefa, bool? valor) {
    setState(() {
      // `bool?` = bool que pode ser nulo. `??` significa "se for null, use false".
      tarefa.concluida = valor ?? false;
    });
  }

  // Abre uma janela para o usuário digitar o título da nova tarefa.
  //
  // - `async` → a função contém operações que DEMORAM (esperar o usuário).
  // - `Future<void>` → a função termina "no futuro" e não devolve valor.
  Future<void> _adicionarTarefa() async {
    // Guarda o que o usuário digita. As funções dentro do TextField conseguem
    String texto = '';

    // `await` espera a janela FECHAR e recebe o valor devolvido pelo
    // Navigator.pop. O `<String>` indica que a janela devolve um texto.
    // Se o usuário cancelar, o resultado é `null`.
    final titulo = await showDialog<String>(
      context: context, // Diz em qual lugar da árvore de widgets abrir a janela.

      // `builder` é uma função que CONSTRÓI o conteúdo da janela.
      // O Flutter a chama no momento de exibir o diálogo.
      builder: (context) {
        return AlertDialog(
          title: const Text('Nova tarefa'),

          // Campo de texto onde o usuário digita.
          content: TextField(
            autofocus: true, // Já abre o teclado.
            decoration: const InputDecoration(
              hintText: 'Ex.: Estudar widgets', // Texto cinza de exemplo.
            ),
            // Chamado a cada letra digitada.
            onChanged: (valor) => texto = valor,
            // Chamado ao apertar "Enter": fecha a janela devolvendo o texto.
            onSubmitted: (valor) => Navigator.pop(context, valor),
          ),

          // Botões na parte de baixo da janela.
          actions: [
            // Fecha SEM devolver valor → o resultado do showDialog será null.
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            // Fecha devolvendo o texto digitado.
            FilledButton(
              onPressed: () => Navigator.pop(context, texto),
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );

    // Validação ("early return"): sai da função se o usuário cancelou (null)
    // ou deixou o campo vazio / só com espaços. `.trim()` remove os espaços
    // do começo e do fim.
    if (titulo == null || titulo.trim().isEmpty) return;

    // Adiciona a nova tarefa e redesenha a tela.
    setState(() {
      tarefas.add(Tarefa(titulo.trim()));
    });
  }

  // ---------------------------------------------------------------------------
  // INTERFACE
  // ---------------------------------------------------------------------------

  // Descreve como a tela aparece. É chamado de novo a cada setState.
  @override
  Widget build(BuildContext context) {
    // Scaffold = esqueleto da tela, com espaços prontos para
    // appBar, body e floatingActionButton.
    return Scaffold(
      // Barra do topo.
      appBar: AppBar(
        title: const Text('TaskFlow'),
      ),

      // Conteúdo principal: a lista de tarefas.
      // ListView.builder cria só os itens VISÍVEIS na tela e permite rolagem.
      body: ListView.builder(
        padding: const EdgeInsets.all(20), // 20 pixels de espaço em volta.
        itemCount: tarefas.length, // Quantos itens a lista tem.

        // Chamado uma vez para cada item, recebendo a posição (0, 1, 2...).
        // Deve devolver o widget que representa aquele item.
        itemBuilder: (context, index) {
          final tarefa = tarefas[index];

          // Linha com checkbox + texto. A linha inteira é clicável.
          return CheckboxListTile(
            // Coloca o checkbox à ESQUERDA do texto.
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(tarefa.titulo),
            // O checkbox apenas MOSTRA o dado; quem muda o dado é o setState.
            value: tarefa.concluida,
            // Chamado quando o usuário toca na linha.
            onChanged: (valor) => _alternarTarefa(tarefa, valor),
          );
        },
      ),

      // Botão redondo no canto inferior direito.
      floatingActionButton: FloatingActionButton(
        // Passa a FUNÇÃO (sem parênteses) para ser chamada no toque.
        // Com `_adicionarTarefa()` ela rodaria na hora de desenhar a tela.
        onPressed: _adicionarTarefa,
        tooltip: 'Adicionar tarefa', // Texto ao segurar o botão.
        child: const Icon(Icons.add),
      ),
    );
  }
}
