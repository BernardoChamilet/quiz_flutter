import 'package:flutter/material.dart';
import 'pergunta.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({super.key, required this.perguntas, required this.perguntaSelecionada, required this.responder });

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Pergunta(questao:perguntas[perguntaSelecionada]['pergunta'] as String),
            //..._escreverRespostas(),
            //Perceba que o metodo passado para Resposta não tem parâmetro.
            // Ele apenas invoca o metodo respoder para somar a pontuacao total
            ...(perguntas[perguntaSelecionada]['respostas'] as List<List<Object>>).map((t) => Resposta(resposta:t[0] as String, onPressed: () => responder(t[1] as int),)),
          ],
        );
  }
}