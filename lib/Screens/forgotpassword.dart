import 'package:appsemillero/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:appsemillero/Screens/verifypassword.dart';

class forgpass extends StatelessWidget {
  const forgpass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "RegisterScreen",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const forgotpassword());
  }
}

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.28,
                  decoration: const BoxDecoration(
                    color: Color(0xff2D148F),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(400)),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.1),
              alignment: Alignment.center,
              child: Text(
                "Recuperar contrasenna",
                style: TextStyle(
                    fontFamily: "mmedium",
                    fontSize: size.height * 0.03,
                    color: Color(0xff2D148F)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.height * 0.03),
              child: Text(
                "Ingrese la dirección de correo electrónico asociada con su cuenta",
                style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: const Color(0xff2D148F),
                    fontFamily: "mregular"),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.12, vertical: size.height * 0.009),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              decoration: BoxDecoration(
                  color: const Color(0xffDBDBDB),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email ",
                  hintStyle: TextStyle(
                    fontFamily: "mregular",
                    fontSize: size.height * 0.022,
                    color: const Color(0xff939393),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.2, vertical: size.height * 0.025),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new verifypassword();
                  }));
                },
                child: Text(
                  "ENVIAR",
                  style: TextStyle(
                    fontSize: size.height * 0.024,
                    fontFamily: "mregular",
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.7, size.height * 0.06),
                    backgroundColor: const Color(0xff2D148F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
