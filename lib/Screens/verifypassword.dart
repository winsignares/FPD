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
        home: verifypassword());
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
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 330,
                    height: 220,
                    padding: EdgeInsets.only(top: 50),
                    margin: EdgeInsets.only(left: 100),
                    decoration: BoxDecoration(
                      color: Color(0xff448493),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(400)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70),
              alignment: Alignment.center,
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    fontFamily: "mmedium",
                    fontSize: 25,
                    color: Color(0xff448493)),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 30, bottom: 15, left: 60, right: 60),
              child: Text(
                "Enter the verification code we just sent you on your email address",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff448493),
                    fontFamily: "mregular"),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(10)),
                    width: 50,
                    height: 50,
                    child: TextField(
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
                    margin: EdgeInsets.only(left: 15, right: 15),
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(10)),
                    width: 50,
                    height: 50,
                    child: TextField(
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
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(10)),
                    width: 50,
                    height: 50,
                    child: TextField(
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
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(10)),
                    width: 50,
                    height: 50,
                    child: TextField(
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
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 18),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new logscreen();
                  }));
                },
                child: Text(
                  "VERIFY",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "mregular",
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: Color(0xff448493),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
                padding:
                    EdgeInsets.only(top: 0, bottom: 15, left: 60, right: 60),
                child: Row(
                  children: [
                    Text(
                      "If you didn’t receive a code!  ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff448493),
                          fontFamily: "mregular"),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Check your imbox!'),
                              content: Text('The code has forwarded.'),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff448493),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Retry',
                                    style: TextStyle(
                                      fontFamily: "mregular",
                                    ),
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
                            fontSize: 15,
                            color: Color(0xff448493),
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
