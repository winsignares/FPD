import 'package:appsemillero/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:appsemillero/Screens/register.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart';
import 'package:appsemillero/Screens/home_page.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: logscreen());
  }
}

class logscreen extends StatefulWidget {
  const logscreen({super.key});

  @override
  State<logscreen> createState() => _logscreenState();
}

class _logscreenState extends State<logscreen> {
  @override
  final user = TextEditingController();
  final password = TextEditingController();
  String users = "";
  String passwords = "";

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  bool _isBiometricAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
    _authenticate();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 140, left: 140, right: 110, bottom: 50),
              alignment: Alignment.center,
              child: Image.asset("assets/logoapp.png"),
            ),
            Text(
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
                color: Color(0xffEAEAEA),
              ),
              padding: EdgeInsets.only(
                left: 30,
                right: 15,
              ),
              margin: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 15),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
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
                color: Color(0xffEAEAEA),
              ),
              padding: EdgeInsets.only(
                left: 30,
                right: 15,
              ),
              margin: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
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
              padding: EdgeInsets.only(top: 0),
              margin: EdgeInsets.only(left: 75, right: 75, top: 30),
              child: ElevatedButton(
                onPressed: () async {
                  users = user.text;
                  passwords = password.text;

                  if (users == "" || passwords == "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Warning'),
                          content: Text('Some places are void'),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff448493),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // cierra el dialogo
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
                  } else {
                    login();
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
                    minimumSize: Size(double.infinity, 50),
                    // Ancho extendido y altura de 50
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new regscreen();
                  }));
                },
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
                  IconButton(
                    onPressed: () async {
                      await _facebookLogin();
                    },
                    icon: Image.asset("assets/fblogo.png",
                        width: 50, height: 100),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    onPressed: () async {
                      await signInWithGoogle();
                    },
                    icon: Image.asset("assets/gmaillogo.png", width: 50),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                left: 100,
                right: 100,
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _checkBiometricAvailability() async {
    bool isAvailable = await _localAuthentication.canCheckBiometrics;
    setState(() {
      _isBiometricAvailable = isAvailable;
    });
  }

  Future<void> _authenticate() async {
    bool isAuthenticated = await _localAuthentication.authenticate(
      localizedReason: 'Autenticacion requerida para ingresar',
    );

    if (isAuthenticated) {
      final storage = FlutterSecureStorage();
      String? storedUser = (await _storage.read(key: 'usuario'));
      String? storedPassword = (await _storage.read(key: 'password'));

      if (storedUser == null || storedPassword == null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Login manually first'),
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
      } else {
        // coloca los datos automaticamente una vez se verifica la huella o rostro
        setState(() {
          user.text = storedUser;
          password.text = storedPassword;
        });
      }
    }
  }

  // metodo para guardar las credenciales del usuario en el almacenamiento seguro de flutter
  Future<void> _saveCredentials(String User, String password) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'User', value: User);
    await storage.write(key: 'Password', value: password);
  }

  Future<void> login() async {
    String? storedUsuario = await _storage.read(key: 'usuario');
    String? storedPassword = await _storage.read(key: 'password');
    String? storedEmail = await _storage.read(key: 'email');
    if (storedUsuario == user.text && storedPassword == password.text) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new MyHomePage(title: 'My home page');
      }));
    }
  }

  _facebookLogin() async {
    // crea instancia de FacebookLogin
    final fb = FacebookLogin();
    // proceso de login
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile, // permisos
      FacebookPermission.email,
    ]);
    // comprueba el resultado del estado
    switch (res.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken? accessToken =
            res.accessToken; // obtiene el token de acceso para la autenticacion
        final profile =
            await fb.getUserProfile(); // obtiene el perfil del usuario
        final email = await fb.getUserEmail(); // obtiene el email del usuario

        print('token de acceso: ${accessToken?.token}');
        print('tu id: ${profile!.userId}');

        if (email != null) print('tu email: $email');

        break;
      case FacebookLoginStatus.cancel:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }
}

Future<UserCredential> signInWithGoogle() async {
  // desencadena el flujo de autenticacion
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // obtiene detalles de autenticacion
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // hace un nuevo token y una credencial
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  print('token de acceso: ${googleAuth?.accessToken}');
  print('token de id: ${googleAuth?.idToken}');
  // cuando inicia sesion devuelve la credencial del usuario
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

_facebookLogin() async {
  // crea instancia de FacebookLogin
  final fb = FacebookLogin();
  // proceso de login
  final res = await fb.logIn(permissions: [
    FacebookPermission.publicProfile, // permisos
    FacebookPermission.email,
  ]);
  // comprueba el resultado del estado
  switch (res.status) {
    case FacebookLoginStatus.success:
      final FacebookAccessToken? accessToken =
          res.accessToken; // obtiene el token de acceso para la autenticacion
      final profile =
          await fb.getUserProfile(); // obtiene el perfil del usuario
      final email = await fb.getUserEmail(); // obtiene el email del usuario

      print('token de acceso: ${accessToken?.token}');
      print('tu id: ${profile!.userId}');

      if (email != null) print('tu email: $email');

      break;
    case FacebookLoginStatus.cancel:
      break;
    case FacebookLoginStatus.error:
      break;
  }
}
