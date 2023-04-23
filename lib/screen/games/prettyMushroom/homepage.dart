import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_app/screen/games/prettyMushroom/character.dart';
import 'dart:async';
import 'package:speech_app/screen/games/prettyMushroom/data/dataset.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, pos});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  var index, pos;
  void initState() {
    index = 0;
    pos = -1.0;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  final questionList = Questions().questions;
  final answerList = Questions().answers;
  final correctOptionList = Questions().correctOption;
  Color colorVal = Colors.white.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Stack(
                children: [
                  Image.asset('assets/images/sky.png',
                      width: double.infinity, fit: BoxFit.cover),
                  Container(
                    child: Character(),
                    alignment: Alignment(pos!, 0.95),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            child: Text(questionList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 227, 201, 201))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                  child: Text(answerList[index][0]),
                                  style: ElevatedButton.styleFrom(
                                      primary: colorVal,
                                      shape: BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)))),
                                  onPressed: () {
                                    setState(
                                      () {
                                        if (correctOptionList[index] - 1 == 0) {
                                          Correct();
                                        } else
                                          Wrong();
                                      },
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (correctOptionList[index] - 1 == 1) {
                                          Correct();
                                        } else {
                                          Wrong();
                                        }
                                      });
                                    },
                                    child: Text(answerList[index][1]),
                                    style: ElevatedButton.styleFrom(
                                        primary: colorVal,
                                        shape: BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (correctOptionList[index] - 1 ==
                                              2) {
                                            Correct();
                                          } else {
                                            Wrong();
                                          }
                                        },
                                      );
                                    },
                                    child: Text(answerList[index][2]),
                                    style: ElevatedButton.styleFrom(
                                        primary: colorVal,
                                        shape: BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))))),
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (correctOptionList[index] - 1 ==
                                              3) {
                                            Correct();
                                          } else {
                                            Wrong();
                                          }
                                        },
                                      );
                                    },
                                    child: Text(answerList[index][3]),
                                    style: ElevatedButton.styleFrom(
                                        primary: colorVal,
                                        shape: BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    alignment: Alignment(0.75, -0.50),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Image.asset(
              'assets/images/brick.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )),
        ],
      )),
    );
  }

  void changeIndex() {
    setState(() {
      if (index < 9)
        index += 1;
      else {
        gameComplete();
      }
    });
  }

  void gameComplete() {
    showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
            body: Center(
          child: Stack(
            children: [
              Expanded(
                  child: Container(
                child: Image.asset(
                  'assets/images/sky.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )),
              Container(
                child: Center(
                    child: Text(
                        "You scored ${((2 + pos) * 2).toInt()} out of 10")),
              )
            ],
          ),
        ));
      },
    );
  }

  void Correct() {
    colorVal = Colors.green.withOpacity(0.5);
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.green,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Correct Option',
              ),
            ))
          ],
        );
      },
    );
    changeIndex();
    pos = pos + 0.2;
  }

  void Wrong() {
    colorVal = Colors.red.withOpacity(0.5);
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.red,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Wrong Option',
              ),
            ))
          ],
        );
      },
    );
    changeIndex();
    changePosNegative();
  }

  void changePosPositive() {
    setState(() {
      if (pos < 1) pos += 0.2;
    });
  }

  void changePosNegative() {
    setState(() {
      if (pos > -1) pos -= 0.2;
    });
  }

  void allCorrect() {
    if (pos == 1) {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Center(
                child: Text('Congrats you won'),
              )
            ],
          );
        },
      );
    }
  }
}
