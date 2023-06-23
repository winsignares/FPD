import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Intro",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const IntroScreen());
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff448493),
      body: Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(
                    left: 130, right: 90, top: 120, bottom: 100),
                child: Image.asset("assets/Semillero.png")),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "MySecurity",
                style: TextStyle(
                    fontSize: 35, fontFamily: "mbold", color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
