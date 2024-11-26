import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;
  const Resultado({super.key, required this.pontuacao, required this.reiniciar});
  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraContainer = larguraTela * 0.55;
    double alturaBox1 = alturaTela * 0.15;
    double alturaBox2 = alturaTela * 0.40; 
    return Column(
      children: <Widget>[
        SizedBox(height: alturaBox1),
        Container (
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Text(
            "Sua Pontuação: $pontuacao/3",
            style: const TextStyle(fontSize: 23),
            textAlign: TextAlign.center,
            ),
        ),
        SizedBox(height: alturaBox2),
        Container(
          width: larguraContainer,
          margin: const EdgeInsets.all(10),
          child: 
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: reiniciar,
            child: const Text(
              'Tentar Novamente',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
                ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]
    );
  }
}