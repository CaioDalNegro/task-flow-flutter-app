import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task_flow/main.dart';

void main() {
  testWidgets('Exibe as tarefas iniciais', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Estudar Dart'), findsOneWidget);
    expect(find.text('Aprender Flutter'), findsOneWidget);
    expect(find.text('Criar meu aplicativo'), findsOneWidget);
  });

  testWidgets('Marca uma tarefa como concluída ao tocar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Todas começam desmarcadas.
    Checkbox primeiroCheckbox() =>
        tester.widget<Checkbox>(find.byType(Checkbox).first);
    expect(primeiroCheckbox().value, isFalse);

    // Tocar no texto marca a tarefa (a linha inteira é clicável).
    await tester.tap(find.text('Estudar Dart'));
    await tester.pump();

    expect(primeiroCheckbox().value, isTrue);
  });
}
