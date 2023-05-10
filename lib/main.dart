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
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
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
              height: 200,
            ),
            //ElevatedButton(
            //child: Text(
            //skoða hér að setja ekki elevated heldur bara nýtt widget með strikunum
            //),

            //),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: const Icon(Icons.add),
      //), //This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
