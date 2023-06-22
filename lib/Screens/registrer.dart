import 'package:flutter/material.dart';

class TerceraRuta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 179, 248, 196),
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 35,
              color: Color.fromARGB(255, 2, 70, 4),
              fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
