import 'package:flutter/material.dart';

class Pergunta extends StatelessWidget {
  final String questao;
  const Pergunta({super.key, required this.questao});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        questao,
        style: const TextStyle(fontSize: 23),
        textAlign: TextAlign.center,
      ),
    );
  }
}