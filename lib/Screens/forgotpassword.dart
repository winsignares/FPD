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
        home: forgotpassword());
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
              padding: EdgeInsets.only(top: 30, bottom: 15, left: 60, right: 60),
              child: Text(
                "Enter the email address associated  with ur account",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff448493),
                    fontFamily: "mregular"),
                    textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 15),
              padding: EdgeInsets.only(left: 30, right: 15),
              decoration: BoxDecoration(
                  color: Color(0xffEAEAEA),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email ",
                  hintStyle: TextStyle(
                    fontFamily: "mregular",
                    fontSize: 20,
                    color: Color(0xff448493),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 18),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new verifypassword();
                  }));
                },
                child: Text(
                  "SEND",
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
          ],
        ),
      ),
    );
  }
}
