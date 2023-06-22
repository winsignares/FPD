import 'package:appsemillero/Screens/login.dart';
import 'package:appsemillero/Screens/registrer.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            // Ancho deseado del Container
            //
            // Altura deseada del Container
            child: Text("Pantalla Principal"),
          ),
          Container(
            child: const Text(
              "CoinKeeper",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w200),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 80,
            width: 180,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff366637),
                elevation: 4.0, // Establece la elevación del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Establece el radio de las esquinas del botón
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contxt) =>
                          TerceraRuta()), // Nombre de la siguiente ruta
                );
              },
              child: Text('LOGIN',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w100)), // Texto del botón
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 80,
            width: 180,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff366637),
                elevation: 4.0, // Establece la elevación del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Establece el radio de las esquinas del botón
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contxt) =>
                          SegundaRuta()), // Nombre de la siguiente ruta
                );
              },
              child: Text('LOGIN',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w100)), // Texto del botón
            ),
          ),
        ],
      )),
    );
  }
}
