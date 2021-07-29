import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
backgroundColor: Colors.blueGrey[800],
            title: Text('Dice '),
          ),
          body: DiceScreen(),
        ),
      ),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDice = 1;
  int rightDice = 1;
  void changeDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/dice$leftDice.png'),
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/dice$rightDice.png'),
              )),
            ],
          ),
          SizedBox(height: 20,),
          RaisedButton(
              child: Text('Roll'),
              onPressed: () {
            changeDice();
          }
          )
        ],
      ),
    );
  }
}
