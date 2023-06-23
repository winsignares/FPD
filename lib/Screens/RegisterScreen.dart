import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "RegisterScreen",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const RegisterSc());
  }
}

class RegisterSc extends StatefulWidget {
  const RegisterSc({super.key});

  @override
  State<RegisterSc> createState() => _RegisterScState();
}

class _RegisterScState extends State<RegisterSc> {
  bool palomita = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 330,
              height: 220,
              margin: const EdgeInsets.only(right: 100),
              decoration: const BoxDecoration(
                color: Color(0xff448493),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(400)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              child: const Text(
                "Sign up",
                style: TextStyle(
                    fontFamily: "mmedium",
                    fontSize: 25,
                    color: Color(0xff448493)),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 50, right: 50, top: 20, bottom: 15),
                padding: const EdgeInsets.only(left: 30, right: 15),
                decoration: BoxDecoration(
                    color: const Color(0xffEAEAEA),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "User",
                  hintStyle: TextStyle(
                    fontFamily: "mregular",
                    fontSize: 20,
                    color: Color(0xff448493),
                  ),
                ))),
            Container(
                margin: const EdgeInsets.only(
                    left: 50, right: 50, top: 5, bottom: 15),
                padding: const EdgeInsets.only(left: 30, right: 15),
                decoration: BoxDecoration(
                    color: const Color(0xffEAEAEA),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontFamily: "mregular",
                        fontSize: 20,
                        color: Color(0xff448493),
                      ),
                    ))),
            Container(
                margin: const EdgeInsets.only(
                    left: 50, right: 50, top: 5, bottom: 15),
                padding: const EdgeInsets.only(left: 30, right: 15),
                decoration: BoxDecoration(
                    color: const Color(0xffEAEAEA),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontFamily: "mregular",
                    fontSize: 20,
                    color: Color(0xff448493),
                  ),
                ))),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    palomita = !palomita;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: palomita,
                      onChanged: (bool? value) {
                        setState(() {
                          palomita = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'Accept terms and conditions',
                      style: TextStyle(
                        fontFamily: "mregular",
                        fontSize: 15,
                        color: Color(0xff448493),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "mregular",
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                        double.infinity, 50), // Ancho extendido y altura de 50
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: const Color(0xff448493),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 60, right: 60, top: 30),
              child: const Divider(
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
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset("assets/gmaillogo.png", width: 50),
                ],
              ),
              padding: const EdgeInsets.only(left: 100, right: 100, top: 30),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }
}
