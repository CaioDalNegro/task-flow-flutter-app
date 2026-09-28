import 'package:flutter/material.dart';

// Ponto de entrada da aplicação.
// É a primeira função executada quando o aplicativo inicia.
void main() {
  runApp(const MyApp());
}

// Responsável por configurar a aplicação ------------------------>
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TaskFlow',
      debugShowCheckedModeBanner: false, // Remove a faixa "DEBUG".
      home: HomePage(), // Define a primeira tela da aplicação.
    );
  }
}

// Modelo que representa uma tarefa -------------------------------->
class Tarefa {
  String titulo;
  bool concluida;

  Tarefa(this.titulo, {this.concluida = false});
}

// Widget que representa a tela principal ------------------------->
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Estado da HomePage ---------------------------------------------->
class _HomePageState extends State<HomePage> {
  final List<Tarefa> tarefas = [
    Tarefa('Estudar Dart'),
    Tarefa('Aprender Flutter'),
    Tarefa('Criar meu aplicativo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
      ),
      // ListView.builder cria os itens sob demanda e permite rolagem.
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = tarefas[index];

          // CheckboxListTile deixa a linha inteira clicável.
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(tarefa.titulo),
            value: tarefa.concluida,
            onChanged: (value) {
              setState(() {
                tarefa.concluida = value ?? false;
              });
            },
          );
        },
      ),
    );
  }
}
