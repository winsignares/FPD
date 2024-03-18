import 'package:appsemillero/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class verifpass extends StatelessWidget {
  const verifpass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "RegisterScreen",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const verifypassword());
  }
}

class verifypassword extends StatefulWidget {
  const verifypassword({super.key});

  @override
  State<verifypassword> createState() => _verifypasswordState();
}

class _verifypasswordState extends State<verifypassword> {
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
                    color: const Color(0xff2D148F)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.height * 0.03),
              child: Text(
                "Ingresa el código de verificación que te acabamos de enviar a tu dirección de correo electrónico",
                style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: const Color(0xff2D148F),
                    fontFamily: "mregular"),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.03,
                        bottom: size.height * 0.013),
                    decoration: BoxDecoration(
                        color: const Color(0xffDBDBDB),
                        borderRadius: BorderRadius.circular(10)),
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    child: const TextField(
                      decoration: InputDecoration(
                        counterText: '',
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      showCursor: false,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.03,
                        bottom: size.height * 0.013),
                    decoration: BoxDecoration(
                        color: const Color(0xffDBDBDB),
                        borderRadius: BorderRadius.circular(10)),
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    child: const TextField(
                      decoration: InputDecoration(
                        counterText: '',
                      ),
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      showCursor: false,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: size.width * 0.04),
                    padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.03,
                        bottom: size.height * 0.013),
                    decoration: BoxDecoration(
                        color: const Color(0xffDBDBDB),
                        borderRadius: BorderRadius.circular(10)),
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    child: const TextField(
                      decoration: InputDecoration(
                        counterText: '',
                      ),
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      showCursor: false,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.03,
                        bottom: size.height * 0.013),
                    decoration: BoxDecoration(
                        color: const Color(0xffDBDBDB),
                        borderRadius: BorderRadius.circular(10)),
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    child: const TextField(
                      decoration: InputDecoration(
                        counterText: '',
                      ),
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      showCursor: false,
                    ),
                  ),
                ],
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
                  "VERIFICAR",
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
            Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Si no recibiste el codigo,",
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          color: const Color(0xff2D148F),
                          fontFamily: "mlight"),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Check your imbox!'),
                              content: const Text('The code has forwarded.',
                                  style: TextStyle(color: Colors.black)),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff2D148F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Retry',
                                    style: TextStyle(
                                        fontFamily: "mregular",
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            color: const Color(0xff2D148F),
                            fontFamily: "mblack"),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
