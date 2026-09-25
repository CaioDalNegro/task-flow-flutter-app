import 'package:flutter/material.dart';

// Ponto de entrada da aplicação.
// É a primeira função executada quando o aplicativo inicia.
void main() {
  // Informa ao Flutter qual será o Widget raiz da aplicação.
  runApp(const MyApp());
}

// Widget raiz da nossa aplicação.
class MyApp extends StatelessWidget {

  const MyApp({super.key}); // Construtor do MyApp.

  // Constrói a interface desse Widget.
  @override
  Widget build(BuildContext context) {

    // MaterialApp representa a configuração principal da aplicação.
    return MaterialApp(
      home: const HomePage(), // A tela inicial da aplicação será definida aqui.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        //margin: EdgeInsets.all(16),
        child: const Column(
          children: [
            Text('Estudar Dart'),
            Text('Aprender Flutter'),
            Text('Criar meu aplicativo'),
          ],
        ),
      ),
    );
  }
}