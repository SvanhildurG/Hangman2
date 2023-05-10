import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  //Make program run again if asked
  var playAgain = true;

  do {
    //List of words
    var words = [
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
    var randomWord = words.elementAt(Random().nextInt(words.length));

    //List to store guessed letters
    var letterInput = [];

    //List images
    var images = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/7.png',
    ];

    //Keep track of wrong guesses
    var wrongGuesses = 0;

    //Display each letter of the word as underscore
    var underscore = [];
    for (var i = 0; i < randomWord.length; i++) {
      underscore.add('_');
    }

    //Input from user guessing a letter / Display images if wrong guess
    while (true) {
      if (wrongGuesses < images.length) {
        print(images[wrongGuesses]);
      }
      print('Entra tu letra');
      String letter = stdin
          .readLineSync(encoding: Encoding.getByName('UTF-8')!)!
          .toLowerCase();

      //Check if letter is in word
      if (letter.toLowerCase() == null || letter.isEmpty) {
        continue;
      }

      // Replace underscore with letter
      letterInput.add(letter);
      bool letterFound = false;
      for (var i = 0; i < randomWord.length; i++) {
        if (randomWord[i] == letter) {
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

      //Display word and compliment / Exit if word complete
      if (wordComplete) {
        print(randomWord);
        print('¡Muy bien!');
        break;
      } else {
        print(underscore.join(' '));
      }

      //Increment wrongGuesses if letter not found
      if (!letterFound) {
        wrongGuesses++;
        //User finishes guesses
        if (wrongGuesses == images.length) {
          print('¡Ahorcado!');
          break;
        }
        print('¡Incorrecto!');
      }
    }

    //Ask if player wants to play again
    print('Jugar de nuevo? (sí o no)');
    String rePlay = stdin
        .readLineSync(encoding: Encoding.getByName('UTF-8')!)!
        .toLowerCase();

    playAgain = rePlay == 'sí';
  } while (playAgain); //Starts again from do if positive
}
