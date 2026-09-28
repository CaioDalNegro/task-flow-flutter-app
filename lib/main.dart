import 'package:flutter/material.dart';

import 'pages/home_page.dart';

// =============================================================================
// PONTO DE ENTRADA
// -----------------------------------------------------------------------------
// `main()` é a primeira função executada quando o aplicativo inicia.
// `runApp()` recebe o widget raiz e o desenha na tela.
// =============================================================================
void main() {
  runApp(const MyApp());
}

// =============================================================================
// CONFIGURAÇÃO DO APP
// -----------------------------------------------------------------------------
// StatelessWidget = widget SEM estado: depois de criado, não muda.
// Ideal aqui, pois a configuração do app é fixa.
// =============================================================================
class MyApp extends StatelessWidget {
  // `super.key` repassa a key (identificador opcional) para a classe pai.
  const MyApp({super.key});

  // `build` descreve como o widget aparece na tela.
  // `@override` indica que estamos reescrevendo um método da classe pai.
  @override
  Widget build(BuildContext context) {
    // `const` → nada aqui dentro muda, então o Flutter não precisa recriar.
    return const MaterialApp(
      title: 'TaskFlow', // Nome do app no sistema (ex.: lista de apps abertos).
      debugShowCheckedModeBanner: false, // Remove a faixa "DEBUG".
      home: HomePage(), // Primeira tela da aplicação.
    );
  }
}
