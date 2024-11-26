import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() onPressed;
  const Resposta({super.key, required this.resposta, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    double larguraContainer = larguraTela * 0.55;
    return Container(
      width: larguraContainer,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: onPressed,
        child: Text(
          resposta,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white
            ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}