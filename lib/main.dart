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
    return MaterialApp(
      home: const HomePage(), // Define a primeira tela da aplicação.
    );
  }
}

// Widget que representa a tela principal ------------------------->
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Estado da HomePage ---------------------------------------------->
class _HomePageState extends State<HomePage> {
  List<bool> tarefasConcluidas = [false, false, false];

  List<String> tarefas = [
    'Estudar Dart',
    'Aprender Flutter',
    'Criar meu aplicativo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: List.generate(tarefas.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Checkbox(
                    value: tarefasConcluidas[index],
                    onChanged: (value) {
                      setState(() {
                        tarefasConcluidas[index] = value!;
                      });
                    },
                  ),
                  Text(tarefas[index]),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}