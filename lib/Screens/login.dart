import 'package:appsemillero/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:appsemillero/Screens/register.dart';
import 'package:appsemillero/Screens/forgotpassword.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const logscreen());
  }
}

class logscreen extends StatefulWidget {
  const logscreen({super.key});

  @override
  State<logscreen> createState() => _logscreenState();
}

class _logscreenState extends State<logscreen> {
  @override
  final email = TextEditingController();
  final password = TextEditingController();
  String emails = "";
  String passwords = "";

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool _isBiometricAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
    _authenticate();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.18, bottom: size.height * 0.12),
              alignment: Alignment.center,
              child: Text(
                'MySecurity',
                style: TextStyle(
                  fontSize: ((size.width + size.height) / 2) * 0.06,
                  fontFamily: 'mbold',
                  color: const Color(0xff2D148F),
                ),
              ),
            ),
            Text(
              "Iniciar sesion",
              style: TextStyle(
                  fontFamily: "mregular",
                  color: const Color(0xff2D148F),
                  fontSize: ((size.width + size.height) / 2) * 0.04),
              textAlign: TextAlign.center,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffDBDBDB),
              ),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.13, vertical: size.height * 0.02),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontFamily: "mxlight",
                      fontSize: ((size.width + size.height) / 2) * 0.03,
                      color: const Color(0xff676565),
                    )),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffDBDBDB),
              ),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.13),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(
                      fontFamily: "mxlight",
                      fontSize: ((size.width + size.height) / 2) * 0.03,
                      color: const Color(0xff676565)),
                ),
                obscureText: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.002),
                  margin: EdgeInsets.only(
                      left: size.width * 0.02, top: size.height * 0.03),
                  child: ElevatedButton(
                    onPressed: () async {
                      emails = email.text;
                      passwords = password.text;

                      if (emails == "" || passwords == "") {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Aviso'),
                              content:
                                  const Text('Debes llenar todos los campos.'),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff2D148F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // cierra el dialogo
                                  },
                                  child: const Text(
                                    'Reintentar',
                                    style: TextStyle(
                                        fontFamily: "mregular",
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        login();
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: Text(
                      "INGRESAR",
                      style: TextStyle(
                        fontSize: ((size.width + size.height) / 2) * 0.03,
                        fontFamily: "mregular",
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.14,
                            vertical: size.height * 0.013),
                        backgroundColor: const Color(0xff2D148F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  child: IconButton(
                    onPressed: () async {
                      await _authenticate();
                    },
                    icon: const Icon(
                      Icons.fingerprint,
                    ),
                    color: const Color(0xff2D148F),
                    iconSize: ((size.width + size.height) / 2) * 0.055,
                  ),
                ),
              ],
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contxt) =>
                            const forgotpassword()), // Nombre de la siguiente ruta
                  );
                },
                child: Text(
                  "Olvide mi contrasenna",
                  style: TextStyle(
                      fontSize: ((size.width + size.height) / 2) * 0.025,
                      color: const Color(0xff2D148F),
                      fontFamily: "mregular"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: size.height * 0.04),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contxt) =>
                            const regscreen()), // Nombre de la siguiente ruta
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿Aún no tienes cuenta? ",
                      style: TextStyle(
                          fontSize: ((size.width + size.height) / 2) * 0.025,
                          color: const Color(0xff2D148F),
                          fontFamily: "mregular"),
                    ),
                    Text(
                      "Registrate",
                      style: TextStyle(
                          fontSize: ((size.width + size.height) / 2) * 0.025,
                          color: const Color(0xff2D148F),
                          fontFamily: "msbold"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await _facebookLogin();
                    },
                    icon: Image.asset("assets/fblogo.png",
                        width: size.width * 0.12),
                  ),
                  SizedBox(
                    width: size.width * 0.07,
                  ),
                  IconButton(
                    onPressed: () async {
                      await signInWithGoogle();
                    },
                    icon: Image.asset("assets/gmaillogo.png",
                        width: size.width * 0.12),
                  ),
                ],
              ),
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
      final storage = const FlutterSecureStorage();
      String? storedEmail = (await _storage.read(key: 'email'));
      String? storedPassword = (await _storage.read(key: 'password'));

      if (storedEmail == null || storedPassword == null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Aviso'),
              content: const Text('Ingresa tus datos por primera vez'),
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
                    'Reintentar',
                    style:
                        TextStyle(fontFamily: "mregular", color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        // coloca los datos automaticamente una vez se verifica la huella o rostro
        setState(() {
          email.text = storedEmail;
          password.text = storedPassword;
          login();
        });
      }
    }
  }

  // metodo para guardar las credenciales del usuario en el almacenamiento seguro de flutter
  Future<void> _saveCredentials(String Email, String password) async {
    final storage = const FlutterSecureStorage();
    await storage.write(key: 'Email', value: Email);
    await storage.write(key: 'Password', value: password);
  }

  Future<void> login() async {
    String? storedUsuario = await _storage.read(key: 'usuario');
    String? storedPassword = await _storage.read(key: 'password');
    String? storedEmail = await _storage.read(key: 'email');
    if (storedEmail == email.text && storedPassword == password.text) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contxt) =>
                const homepage()), // Nombre de la siguiente ruta
      );
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
