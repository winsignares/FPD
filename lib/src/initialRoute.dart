// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialRoute extends StatefulWidget {
  static const routeName = 'InitialRoute';

  const InitialRoute({Key? key}) : super(key: key);

  @override
  _InitialRouteState createState() => _InitialRouteState();
}

class _InitialRouteState extends State<InitialRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello World!', style: GoogleFonts.rubik(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}
