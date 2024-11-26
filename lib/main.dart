import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

void main(){
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  //construtor
  const QuizApp({super.key});
  //instaciando estado da classe estado de quizapp criada acima
  @override
  State<QuizApp> createState(){
    return _QuizAppState();
  }
}

//criando classe de estado para servir como estado da classe quizapp
class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
      {
        'pergunta': 'Qual é a minha cor favorita?',
        'respostas': [
        ['Rosa', 1],
        ['Branco', 0],
        ['Preto', 0],
        ['Azul', 0]
        ]
      },
      {
        'pergunta': 'Qual é a minha comida favorita?',
        'respostas': [
          ['Sushi', 1],
          ['Hamburguer', 0],
          ['Pizza', 0],
          ['Pastel', 0]
        ]
      },
      {
        'pergunta': 'Qual é a meu animal favorito?',
        'respostas': [
          ['Cachorro', 0],
          ['Furão', 0],
          ['Calopsita', 1],
          ['Leão', 0]
        ]
      },
    ];
  //ATENÇÃO: O seguinte código comentado é uma maneira de fazer gerar lista
  // de widgets de respostas para só chama-la no build
  //List<Widget> _escreverRespostas(){
  //  List<Widget> respostas = [];
  //  for (var resp in perguntas[_perguntaSelecionada]['respostas'] as List<String>){
  //      respostas.add(Resposta(resposta:resp, onPressed: _responder,));
  //    }
  //    return respostas;      
  //}
  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }
  void _responder(int pontuacao){
    if (temPergunta){
      //setState necessário em trechos que mudam o estado da classe(chama a build dnv)
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }
  void _reiniciar(){
    setState(() {
        _perguntaSelecionada = 0;
        _pontuacaoTotal = 0;
      });
  }
  //func build renderiza a página/retorna o widget raiz da aplicação
  //necessita @override pois está sobrescrevendo um metodo da classe statelesswidget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue ,
          title: const Text('Quiz!'),
          centerTitle: true,
        ),
        body: temPergunta ? 
        Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, responder: _responder) 
        : Resultado(pontuacao: _pontuacaoTotal,reiniciar: _reiniciar,),
      ),
    );
  }
}
