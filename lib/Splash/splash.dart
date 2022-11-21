import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../AdminModule/startingPage.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 6), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StartingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      //width: 250.0,
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 50.0,
            fontFamily: 'Bombers',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText("UEM",speed: const Duration(milliseconds: 200),textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ],
            // onTap: () {
            //   print("Tap Event");
            // },
          ),
        ),
      ),
    );
  }
}
