import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahorcado',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Ahorcado'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); //Homepage

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> words = [
    'lluvia',
    'viento',
    'humedad',
    'calor',
    'frío',
    'niebla',
    'nieve',
    'sol',
    'nube'
  ];
  String randomWord = '';
  //List<String> _guessedLetters = []; //Already defined
  int _wrongGuesses = 0; //Not using
  List<String> _underscore = [];

  void wrongGuesses() {
    //Try to use counter with images, have set state (Gunnar) and counter but haven't got it to work
    //void because setState - from error message
    setState(() {
      _wrongGuesses++;
    });
  }

  @override
  void initState() {
    //Object is inserted to a tree - can not set _randomWord above
    super.initState();
    randomWord = words.elementAt(Random().nextInt(words.length));
    _underscore = List.generate(randomWord.length, (_) => '_');
  } //Display of underscores but beneath the image and very small - try and fix that next

  void _guessedLetters(String letter) {
    bool letterFound = false;
    setState(() {
      for (var i = 0; i < randomWord.length; i++) {
        if (randomWord[i] == letter) {
          _underscore[i] = letter;
          letterFound = true;
        }
      }
      if (!letterFound) {
        wrongGuesses();
      }
    });
  }

  Widget build(BuildContext context) {
    //method reruns every time setState is called
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/1.png',
              //'assets/image$_wrongGuesses.png', //Use setState - must be above the widget tree
              height: 200,
              width: 200,
            ),
            Text(_underscore.join('_')),

            //set state: setState(() { _myState = newValue; });

            //ElevatedButton(
            //child: Text(
            //skoða að setja ekki elevated heldur bara setja underscore fyrir ofan myndina
            //),
            //),
          ],
        ),
      ),
    );

    //floatingActionButton: FloatingActionButton(
    //onPressed: _incrementCounter,
    //tooltip: 'Increment',
    //child: const Icon(Icons.add),
    // function to handle wrong guesses
    //This trailing comma makes auto-formatting nicer for build methods.
  }
}
