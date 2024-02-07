import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});
  @override
  State<Jogo> createState() => _JogoState();
}
class _JogoState extends State<Jogo> {
  // o uso do anderline para uso apenas dentro dessa classe
  var _imagemApp = const AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = const AssetImage("assets/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = const AssetImage("assets/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = const AssetImage("assets/tesoura.png");
        });
        break;
    }
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        _mensagem = "Parabéns você ganhou!!! :)";
      });
    }else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      _mensagem = "Você perdeu :(";
    }else{
      _mensagem = "Opa empatamos :|";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JokenPo'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Escolha do App:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Image(image: _imagemApp),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(_mensagem,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "assets/pedra.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada("papel"),
                  child: Image.asset(
                    "assets/papel.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "assets/tesoura.png",
                    height: 100,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
