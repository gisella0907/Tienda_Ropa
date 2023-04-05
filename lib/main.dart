import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeAlter(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class HomeAlter extends StatelessWidget {
  HomeAlter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pantalla anterior"),
          backgroundColor: Colors.purple[900],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton( 
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      Products())),
                      icon: Icon(Icons.arrow_circle_right_outlined)),
                      Text("Pantalla anterior 1"),
              IconButton( 
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      Products2())),
                      icon: Icon(Icons.arrow_circle_right_outlined)),
                      Text("Pantalla anterior 2"),
                  ],
                ),
        ));
  }
}


class Products extends StatelessWidget {
  Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
      ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Image.asset("images/logo.png"),
                alignment: Alignment.center
              ),
              Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Inicio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                      Icon(
                        Icons.edit,
                        color: Colors.purple[900],
                        size: 30.0,
                      ),
                    ],
                  ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Image.asset("images/Ropa1.png"),
                alignment: Alignment.center
              ),Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Image.asset("images/Ropa2.png"),
                alignment: Alignment.center
              ),   
            ]
          ),
        ));
  }
}


class Products2 extends StatelessWidget {
  Products2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
      ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Image.asset("images/logo.png"),
                alignment: Alignment.center
              ),
              Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Inicio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
                    ],
                  ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Image.asset("images/Ropa1.png"),
                alignment: Alignment.center
              ),Container(
                margin: const EdgeInsets.only(top: 25,bottom: 20),
                child: Image.asset("images/Ropa2.png"),
                alignment: Alignment.center
              ),   
            ]
          ),
        ));
  }
}

