import 'package:flutter/material.dart';
import 'package:flutter_v2_aleksander_bjelk/secondPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Matrix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Welcome to the Matrix'),
        '/second':(context) => const MySecondPage(title:'Think thoroughly...'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          //GIF som bakgrund
          Positioned.fill(
            child: Image.network(
              'https://media1.tenor.com/m/vOfmcVd-haMAAAAC/code-purpose-of-life.gif',
              fit: BoxFit
                  .cover,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                    child: const Text("Go to the second Page to choose your pill"),
                  ),
                ),
                const Text(
                  'Choose wisely.',
                  style: TextStyle(color: Colors.red)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
