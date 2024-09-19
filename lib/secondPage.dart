import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key, required this.title});
  final String title;

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {

  //url för om man trycker på rött piller
  Future<void> _launchURLRed() async {
    final url = Uri.parse('https://www.imdb.com/title/tt0133093/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }

  //url för om man trycker på blå piller
  Future<void> _launchURLBlue() async {
    final url = Uri.parse('https://tenor.com/sv/search/he-chose-poorly-gifs'); // Din URL här
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.4; //40% av skärmens bredd
    double imageHeight = imageWidth * 1.12;

    //definierar storlekar beroende på plattform
    double bluePillWidth;
    double bluePillHeight;
    double redPillWidth;
    double redPillHeight;

    if (Theme.of(context).platform == TargetPlatform.android) {
      bluePillWidth = imageWidth;
      bluePillHeight = imageHeight;
      redPillWidth = imageWidth;
      redPillHeight = imageHeight;
    } else {
      bluePillWidth = 336;
      bluePillHeight = 383;
      redPillWidth = 342;
      redPillHeight = 383;
    }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: _launchURLRed,
                      child: Image.asset(
                        'assets/images/redpill.png',
                        width: redPillWidth,
                        height: redPillHeight,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Theme.of(context).platform == TargetPlatform.android) {
                          SystemNavigator.pop(); //stäng android appen
                        } else {
                          _launchURLBlue(); //öppna url om det är på web
                        }
                      },
                      child: Image.asset(
                        'assets/images/bluepill.png',
                        width: bluePillWidth,
                        height: bluePillHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 300,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(text: 'This is your last chance. After this, there is no turning back. '),
                        TextSpan(text: 'You take the blue pill', style: TextStyle(color: Colors.blue)),
                        TextSpan(text: ' - the story ends, you wake up in your bed and believe whatever you want to believe. '),
                        TextSpan(text: 'You take the red pill', style: TextStyle(color: Colors.red)),
                        TextSpan(text: ' - you stay in Wonderland and I show you how deep the rabbit hole goes.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}