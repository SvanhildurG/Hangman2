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
      home: const MyHangMan(title: 'Ahorcado'),
    );
  }
}

class MyHangMan extends StatefulWidget {
  const MyHangMan({super.key, required this.title}); //Homepage

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
//From tic tac toe - trying to reset game with elevated button
  //Error: Classes can't be declared inside other classes!!!! - look at next!!!! - Above class _MyHangmanState?
  class _GameScreen extends State<MyHangMan> {
  Game game = Game();

  }

  String randomWord = '';
  //List<String> _guessedLetters = []; //Already defined
  int _wrongGuesses = 0; //Not using
  //List<String> letterInput = []; //Ath!!!
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
      }
      _textController.clear();
    });
  }

  @override
  //Call initState method to initialize randomWord and underscore
  //Within void - don't return value
  void initState() {
    super.initState();
    randomWord = words.elementAt(Random().nextInt(words.length));
    underscore = List.generate(randomWord.length, (_) => '_');
  }

  Widget build(BuildContext context) {
    //method reruns every time setState is called
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            //Display of images after each wrong guess, using map
            Image.asset(
              'assets/images/${images[_wrongGuesses]}', //Works but get error message after 7 images - look at next
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
            Text(
              underscore.join(' '),
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            //User can input a letter by tapping on instructions, introducing the letter in the box and press enter
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
                    //Clear what's currently in the textfield
                    _textController.clear();
                  },
                  icon: const Icon(Icons.keyboard),
                ),
              ),
            ),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    onPressed: () {
                 },
                    icon: Icon(Icons.replay),
                    label: Text('Jugar de nuevo'),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

//Need a place to keep track of incorrect guessed letters
//Need a way to stop the game if finished with or without success:
//give positive feedback on success and jugar de nuevo button
//show word and end game with jugar de nuevo button if not success
//Additional requirements:
//Add homescreen with gif??? BMI calculator section of Flutter Course
//https://flutterawesome.com/bmi-calculator-using-flutter/:
/*class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
*/
//https://github.com/londonappbrewery/BMI-Calculator-Flutter-Completed/blob/master/lib/screens/input_page.dart
