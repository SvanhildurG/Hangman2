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
  List<String> letterInput = [];
  List<String> underscore = [];
  List<String> images = [];
  final _textController = TextEditingController();

  void wrongGuesses() {
    //Try to use counter with images, have set state (Gunnar) and counter but haven't got it to work
    //void because setState - from error message
    setState(() {
      _wrongGuesses++;
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

  void _guessedLetters(String letter) {
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
    });
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
            Center(
              child: Stack(
                //Trying Stack
                children: [],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              underscore.join(' '),
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              //Try later!!!
              'assets/images/1.png',
              //'assets/image$_wrongGuesses.png', //Use setState - must be above the widget tree
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 60),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: '¡Entra tu letra!',
                hintStyle: TextStyle(
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
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: (); //Trying keyboard, need set state? and define, maybe comes by itself on Android?: https://www.youtube.com/watch?v=LFQgZc4oKa4
      //child: const Icon(Icons.keyboard),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
