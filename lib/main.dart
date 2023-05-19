import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //from tic tac toe

  // Root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahorcado',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHangMan(title: 'Ahorcado'),
    );
  }
}

class MyHangMan extends StatefulWidget {
  const MyHangMan({Key? key, required this.title}) : super(key: key); //Homepage

  final String title;

  @override
  State<MyHangMan> createState() => _MyHangManState();
}

class _MyHangManState extends State<MyHangMan> {
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
  int _wrongGuesses = 0;
  List<String> underscore = [];
  List<String> images = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
    '7.png'
  ];

  final _textController = TextEditingController(); //Takes input from keyboard
  List<String> guessedLetters = [];

  //Increase/show images one by one if user guesses wrong letter
  void wrongGuesses() {
    setState(() {
      _wrongGuesses++;
    });
  }

//Check if letter is to be found in word or not
  void checkLetter(String letter) {
    bool letterFound = false;
    setState(() {
      for (var i = 0; i < randomWord.length; i++) {
        if (randomWord[i] == letter) {
          underscore[i] = letter;
          letterFound = true;
        }
      }
      if (!letterFound) {
        wrongGuesses();
        guessedLetters.add(letter); //Wrong letter to list
      }
      _textController.clear();
    });
  }

  //Stop game

  // Restart the game
  void reStart() {
    setState(() {
      _wrongGuesses = 0;
      randomWord = words.elementAt(Random().nextInt(words.length));
      underscore = List.generate(randomWord.length, (_) => '_');
      guessedLetters.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    randomWord = words.elementAt(Random().nextInt(words.length));
    underscore = List.generate(randomWord.length, (_) => '_');
  }

  @override
  Widget build(BuildContext context) {
    //method reruns every time setState is called
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Display of images after each wrong guess
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/${images[_wrongGuesses]}',
              height: 200,
              width: 200,
            ),
            //Display of underscores
            const SizedBox(height: 16),
            Text(
              underscore.join(' '),
              style: const TextStyle(
                fontSize: 75,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Display of incorrect letters
            const SizedBox(height: 20),
            Text(
              'Incorrecto: ${guessedLetters.join(' - ')}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.pink,
                fontSize: 25,
              ),
            ),
            //Input from user from keyboard
            const SizedBox(height: 16),
            TextField(
              controller: _textController,
              onSubmitted: checkLetter,
              decoration: InputDecoration(
                hintText: '¡Entra tu letra!',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.pinkAccent,
                ),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    //Clear the textfield
                    _textController.clear();
                  },
                  icon: const Icon(Icons.keyboard),
                ),
              ),
            ),
            //Play again
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton.icon(
                  onPressed: (reStart),
                  icon: const Icon(Icons.replay),
                  label: const Text('Jugar de nuevo'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Need a way to STOP the game if finished with or without success:
//show word and end game if not success!!!
//I can still guess letters after success!!! Stop that!
//Maybe break, maybe boolean, stop??? Logic file?!

//Additional requirements:
//Add homescreen with gif??? BMI calculator section of Flutter Course
//https://flutterawesome.com/bmi-calculator-using-flutter/:
/*class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
*/
//https://github.com/londonappbrewery/BMI-Calculator-Flutter-Completed/blob/master/lib/screens/input_page.dart
