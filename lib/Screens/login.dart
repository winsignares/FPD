import 'RegisterScreen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final user = TextEditingController();
  final password = TextEditingController();
  String users = "";
  String passwords = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 140, left: 140, right: 110, bottom: 50),
              alignment: Alignment.center,
              child: Image.asset("assets/Semillero.png"),
            ),
            const Text(
              "Log in",
              style: TextStyle(
                  fontFamily: "mmedium",
                  color: Color(0xff448493),
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffEAEAEA),
              ),
              padding: const EdgeInsets.only(
                left: 30,
                right: 15,
              ),
              margin: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 15),
              child: TextField(
                controller: user,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "User",
                    hintStyle: TextStyle(
                      fontFamily: "mregular",
                      fontSize: 20,
                      color: Color(0xff448493),
                    )),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffEAEAEA),
              ),
              padding: const EdgeInsets.only(
                left: 30,
                right: 15,
              ),
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(
                      fontFamily: "mregular",
                      fontSize: 20,
                      color: Color(0xff448493)),
                ),
                obscureText: true,
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.only(top: 0),
              margin: const EdgeInsets.only(left: 75, right: 75, top: 30),
              child: ElevatedButton(
                onPressed: () {
                  users = user.text;
                  passwords = password.text;

                  if (users == "" || passwords == "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Warning'),
                          content: const Text('Some places are void'),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff448493),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // cierra el dialogo
                              },
                              child: const Text(
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
                  } else {
                    // Se usa para ir a otras pantallas el push solito
                    // el pushandremoveultil es para quitar la pantalla anterior y no haya back
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new RegisterSc();
                    }));
                  }
                },
                child: Text(
                  "ENTER",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "mregular",
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                        double.infinity, 50), // Ancho extendido y altura de 50
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: Color(0xff448493),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100, right: 100),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot my password",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff448493),
                      fontFamily: "mregular"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 60, right: 60),
              padding: EdgeInsets.only(top: 35),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Don't have account yet? Sign up.",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff448493),
                      fontFamily: "mregular"),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 60, right: 60, top: 0),
              child: Divider(
                color: Color(0xff448493),
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/fblogo.png",
                    width: 50,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Image.asset("assets/gmaillogo.png", width: 50),
                ],
              ),
              padding: EdgeInsets.only(left: 100, right: 100, top: 30),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }
}
