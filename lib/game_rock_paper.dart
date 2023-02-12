import 'dart:math';

import 'package:flutter/material.dart';

class GameRockPaper extends StatefulWidget {
  const GameRockPaper({super.key});
  @override
  State<GameRockPaper> createState() => _GameRockPaperState();
}

class _GameRockPaperState extends State<GameRockPaper> {
  List<String> itemGame = ['paper_btn', 'rock_btn', 'scisor_btn'];

  String? currntChoiceUser;
  String? currntChoiceComputer;
  int? golesUser;
  int? golesComputer;
  String? success;

  @override
  void initState() {
    currntChoiceUser = itemGame[2];
    golesComputer = 0;
    golesUser = 0;

    currntChoiceComputer = itemGame[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int? RandomC;
    int? RandomU;
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
        title: const Text(
          'Rock Paper Scissors',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: (() {
                      setState(() {
                        RandomC = Random().nextInt(3);
                        currntChoiceComputer = itemGame[RandomC!];
                        RandomU = Random().nextInt(3);
                        currntChoiceUser = itemGame[RandomU!];
                        success = result(RandomU!, RandomC!);
                        if (success == 'user') {
                          golesUser = golesUser! + 1;
                        } else if (success == 'computer') {
                          golesComputer = golesComputer! + 1;
                        } else {
                          print('==');
                        }
                      });
                    }),
                    child: Column(
                      children: [
                        Image.asset('images/$currntChoiceUser.png'),
                        const Text(
                          'USER',
                          style: TextStyle(fontSize: 20),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: Text('$golesUser',
                              style: const TextStyle(fontSize: 20)),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset('images/$currntChoiceComputer.png'),
                      const Text(
                        'COMPUTER',
                        style: TextStyle(fontSize: 20),
                      ),
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Text('$golesComputer',
                            style: const TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Colors.red)))),
                onPressed: () {
                  setState(() {
                    golesUser = 0;
                    golesComputer = 0;
                  });
                },
                child: Text("Restart Game".toUpperCase(),
                    style: const TextStyle(fontSize: 14)))
          ],
        ),
      ),
    );
  }
}

String result(int user, int computer) {
  if (user + computer == 1 && user != computer) {
    if (user < computer) {
      return 'user';
    }

    return 'computer';
  } else if (user + computer == 2 && user != computer) {
    if (user > computer) {
      return 'user';
    }

    return 'computer';
  } else if (user + computer == 3 && user != computer) {
    if (user < computer) {
      return 'user';
    }
    return 'computer';
  } else {
    return '0';
  }
}
