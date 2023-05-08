import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart'; //need flutter sdk
//import 'package: dart_random_choice/dart_random_choice.dart';

void main() {
  /*runApp(const MyApp());

  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Ahorcado',
  theme: ThemeData(useMaterial3: true),
  home: Scaffold(
  appBar: AppBar(
  title: const Text('...'),
  ),
 }
}
*/

  //Make program run again if asked
  var playAgain = true;

  do {
    //List of words - growable list
    var list_words = [
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

    //Choose a random word from the list
    var word = list_words.elementAt(Random().nextInt(list_words.length));

    //List to store guessed letters
    var letterInput = [];

    //Limit guesses - set maximum
    //var wrongGuesses = 6; //trying to find out how to decrease and add images

    //Display each letter of the word as underscore
    var underscore = [];
    for (var i = 0; i < word.length; i++) {
      underscore.add('_');
    }

    //Input from user guessing a letter - limited to 6
    while (true) {
      //while (wrongGuesses > 0 || wrongGuesses < 6) {
      print('Entra tu letra');
      String letter = stdin
          .readLineSync(encoding: Encoding.getByName('UTF-8'))
          .toLowerCase();

      //Check if letter is in word
      if (letter.toLowerCase() == null || letter.isEmpty) {
        continue;
      } //maybe change to false, something = false to stop the loop
/*
      //Decrease wrongGuesses
      //if (letter.toLowerCase() == null || letter.isEmpty) {
      //wrongGuesses--;
      //}
      //wrongGuesses--;
      //for (var i = wrongGuesses; i > 0; i--) {}
      bool letterIn = false;
      for (var i = 0; i < word.length; i++) {
        if (word[i] == letter) {
          underscore[i] = letter;
          letterIn == true;
        }
      }
      //Decrease here with if? - can't decrease only wrong answers, see here and above
      if (!letterIn) {
        wrongGuesses--;
      }
*/
      // Replace underscore with letter
      letterInput.add(letter);
      bool letterFound = false;
      for (var i = 0; i < word.length; i++) {
        if (word[i] == letter) {
          underscore[i] = letter;
          letterFound = true;
        }
      }

      //Check if word complete
      bool wordComplete = true;
      for (var letter in underscore) {
        if (letter == '_') {
          wordComplete = false;
          break;
        }
      }
      //Display word and compliment - exit if word complete
      if (wordComplete) {
        print(word);
        print('¡Muy bien!');
        break;
      } else {
        print(underscore.join(
            ' ')); //https://www.educative.io/answers/what-is-the-stringsjoin-method-in-dart
      }

      //Or an error message
      if (!letterFound) {
        print('¡Incorrecto!');
      }
    }

    //Check if user finishes guesses
    //if (guessesLeft == 0){
    //print('¡Ahorcado!');
    //}

    //Ask if player wants to play again
    print('Jugar de nuevo? (sí o no)');
    String rePlay =
    stdin.readLineSync(encoding: Encoding.getByName('UTF-8')).toLowerCase();

    playAgain = rePlay == 'sí';
  } while (playAgain); //do while (byrjar uppi)
}
//næst - finna út með myndirnar og setja takmarkanir á giskið
//er búin að ná að setja takmarkanir en bara á allt gisk, þarf að vera bara röng gisk
//skoða for loop fyrir þetta: for ... in ... decrease , for each error...,
