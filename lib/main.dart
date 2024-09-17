import 'package:flutter/material.dart';
import 'package:flutter_v2_aleksander_bjelk/secondPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'HOME'),
        '/second':(context) => const MySecondPage(title:'SecondPage'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      Fluttertoast.showToast(
        msg: "Counter is now $_counter",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          // GIF as background
          Positioned.fill(
            child: Image.network(
              'https://media1.tenor.com/m/vOfmcVd-haMAAAAC/code-purpose-of-life.gif',
              fit: BoxFit
                  .cover, // This makes the GIF cover the entire background
            ),
          ),
          // Content on top of the GIF
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                  style:
                      TextStyle(color: Colors.white), // Text color to stand out
                ),
                Text("data"),
                FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  child: const Text("Go to Second Page"),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
