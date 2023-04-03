import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String userChoice = '';
  String computerChoice = '';

  String displayUserChoice = 'Faça a primeira jogada...';
  String displayComputerChoice = '...e o computador jogará ao mesmo tempo!';

  String imageComputerChoice = 'no';
  String winner = 'Veremos quem ganha :)';
  int win = 0;
  int lose = 0;
  int draw = 0;

  void setUserChoice(String choiced) {
    setState(() {
      displayUserChoice = 'Você escolheu $choiced!';
      userChoice = choiced;
    });
    setComputerChoice();
  }

  void setComputerChoice() {
    setState(() {
      const availableChoices = ['pedra', 'papel', 'tesoura'];
      String random = availableChoices[
        Random().nextInt(availableChoices.length)
      ];
      imageComputerChoice = random;
      computerChoice = random;
      displayComputerChoice = 'O computador escolheu $random!';
    });
    checkWinner();
  }

  void checkWinner() {
    setState(() {
      winner = 'Você ganhou :)';

      if (userChoice == 'pedra') {
        if (computerChoice == 'pedra') {
          winner = 'Empate!'; draw++;
      } else if (computerChoice == 'papel') {
          winner = 'Você perdeu :('; lose++;
        }
      } else if (userChoice == 'papel') {
        if (computerChoice == 'papel') {
          winner = 'Empate!'; draw++;
        } else if (computerChoice == 'tesoura') {
          winner = 'Você perdeu :('; lose++;
        }
      } else if (userChoice == 'tesoura') {
        if (computerChoice == 'tesoura') {
          winner = 'Empate!'; draw++;
        } else if (computerChoice == 'pedra') {
          winner = 'Você perdeu :('; lose++;
        }
      }

      if (winner == 'Você ganhou :)') {
        win++;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pedra, papel e tesoura')),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 20),
            child: Text('Escolha!'),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(53, 0, 10, 20),
                child: GestureDetector(
                    onTap: () { setUserChoice('pedra'); },
                    child: Image.asset('assets/images/pedra.png')
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 20),
                child: GestureDetector(
                    onTap: () { setUserChoice('papel'); },
                    child: Image.asset('assets/images/papel.png')
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 20),
                child: GestureDetector(
                    onTap: () { setUserChoice('tesoura'); } ,
                    child: Image.asset('assets/images/tesoura.png')
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(displayUserChoice),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Image.asset('assets/images/$imageComputerChoice.png'),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
            child: Text(displayComputerChoice),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(winner),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text('Suas vitórias: $win'),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text('Suas derrotas: $lose'),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text('Seus empates: $draw'),
          ),
        ],
      ),
    );
  }
}
