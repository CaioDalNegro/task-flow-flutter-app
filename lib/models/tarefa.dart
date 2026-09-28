// =============================================================================
// MODELO: Tarefa
// -----------------------------------------------------------------------------
// Classe Dart pura
// Juntar título e status em um único objeto evita ter duas listas separadas
// que precisariam ficar sempre alinhadas.
// =============================================================================

class Tarefa {
  // Texto exibido na lista. Ex.: 'Estudar Dart'.
  String titulo;

  // Indica se a tarefa já foi feita (checkbox marcado).
  bool concluida;

  // Construtor:
  // - `this.titulo` → parâmetro POSICIONAL e OBRIGATÓRIO.
  //   Atalho do Dart que já atribui o valor ao campo `titulo`.
  // - `{this.concluida = false}` → parâmetro NOMEADO e OPCIONAL.
  //   Se não for informado, a tarefa começa como não concluída.
  //
  // Exemplos de uso:
  //   Tarefa('Estudar Dart');                  // concluida = false
  //   Tarefa('Estudar Dart', concluida: true); // concluida = true
  Tarefa(this.titulo, {this.concluida = false});
}
