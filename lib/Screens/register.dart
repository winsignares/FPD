import 'package:appsemillero/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:appsemillero/Screens/login.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:appsemillero/post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class registerscreen extends StatelessWidget {
  const registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "RegisterScreen",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const regscreen());
  }
}

class regscreen extends StatefulWidget {
  const regscreen({super.key});

  @override
  State<regscreen> createState() => _regscreenState();
}

class _regscreenState extends State<regscreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool palomita = false;
  final phone_numberr = TextEditingController();
  final passwordr = TextEditingController();
  final emailr = TextEditingController();
  int phone_numbertemp = 0;
  String passwordtemp = "";
  String emailtemp = "";

  //funciones para call APIS
  Future<Post?>? post;

  void createuser() {
    setState(() {
      post = createPost(
          emailr.text, passwordr.text, int.parse(phone_numberr.text));
    });
  }

  // test funcion tipo arma a la bd con lo que tenga el textfield email
  void tipoarmapost() {
    setState(() {
      post = tipoarmaPost(emailr.text);
    });
  }

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
              children: [
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.28,
                  decoration: const BoxDecoration(
                    color: Color(0xff2D148F),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(400)),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.05),
              alignment: Alignment.center,
              child: Text(
                "Registrarse",
                style: TextStyle(
                    fontFamily: "mregular",
                    fontSize: ((size.width + size.height) / 2 * 0.04),
                    color: const Color(0xff2D148F)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.12,
                    right: size.width * 0.12,
                    top: size.width * 0.04,
                    bottom: size.width * 0.03),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                decoration: BoxDecoration(
                    color: const Color(0xffDBDBDB),
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                    controller: emailr,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontFamily: "mxlight",
                        fontSize: ((size.width + size.height) / 2 * 0.03),
                        color: const Color(0xff676565),
                      ),
                    ))),
            Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.12,
                    right: size.width * 0.12,
                    bottom: size.width * 0.03),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                decoration: BoxDecoration(
                    color: const Color(0xffDBDBDB),
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                    controller: passwordr,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontFamily: "mxlight",
                        fontSize: ((size.width + size.height) / 2 * 0.03),
                        color: const Color(0xff676565),
                      ),
                    ))),
            Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.12,
                    right: size.width * 0.12,
                    bottom: size.width * 0.03),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                decoration: BoxDecoration(
                    color: const Color(0xffDBDBDB),
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phone_numberr,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Telefono",
                      hintStyle: TextStyle(
                        fontFamily: "mxlight",
                        fontSize: ((size.width + size.height) / 2 * 0.03),
                        color: const Color(0xff676565),
                      ),
                    ))),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  //ventana de terminos y condiciones
                  tacwindow(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: palomita,
                      onChanged: (bool? value) {
                        setState(() {
                          palomita = !palomita;
                        });
                      },
                    ),
                    Text(
                      'Acepto los Terminos y Condiciones',
                      style: TextStyle(
                        fontFamily: "mregular",
                        fontSize: ((size.width + size.height) / 2 * 0.025),
                        color: const Color(0xff2D148F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.18, vertical: size.height * 0.02),
              child: ElevatedButton(
                onPressed: () {
                  //verifica que se hayan leido los terminos y condiciones y esten todos los campos requeridos

                  registerdata();
                },
                child: Text(
                  "REGISTRARME",
                  style: TextStyle(
                    fontSize: ((size.width + size.height) / 2 * 0.03),
                    fontFamily: "mregular",
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.12,
                        vertical: size.height * 0.013),
                    backgroundColor: const Color(0xff2D148F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.15,
                  right: size.width * 0.15),
              child: const Divider(
                color: Color(0xffA49D9D),
                thickness: 1,
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

  Future<void> registerdata() async {
    bool isValid = emailr.text.contains('@');
    if (palomita == true &&
        phone_numberr.text != '' &&
        passwordr.text != '' &&
        emailr.text != '' &&
        isValid == true) {
      createuser();
      phone_numbertemp.toString();
      passwordtemp = passwordr.text;
      emailtemp = emailr.text;
      await _storage.write(
          key: 'phone_number', value: phone_numbertemp.toString());
      await _storage.write(key: 'password', value: passwordtemp);
      await _storage.write(key: 'email', value: emailtemp);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new logscreen();
      }));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Aviso'),
            content: const Text(
                'Es necesario revisar los T&C y llenar todos los campos'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D148F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {
                  Navigator.of(context).pop();
                  tacwindow;
                },
                child: const Text(
                  'Reintentar',
                  style: TextStyle(fontFamily: "mregular", color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void tacwindow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "T&C",
                    style: TextStyle(
                        fontSize: ((size.width + size.height) / 2 * 0.035),
                        fontFamily: 'mbold',
                        color: const Color(0xff2D148F)),
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.only(
                      top: size.height * 0.03, bottom: size.height * 0.02),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Column(
                    children: [
                      const Text(
                        '1. Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan. Et ullamcorper egestas non dui nulla pharetra tempor nunc. Urna suspendisse molestie ultricies risus commodo justo augue velit sem.'
                        '\n\n1.1 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.2 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.3 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.4 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.5 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.6 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.7 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.8 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n1.9 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n2. Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n2.1 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.'
                        '\n\n2.2 Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan.',
                        style: TextStyle(
                            fontFamily: 'mlight', color: Color(0xff2D148F)),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.02),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (palomita != null || palomita) {
                                  setState(() {
                                    palomita = false;
                                  });
                                  Navigator.pop(
                                      context); // Cerrar la ventana emergente
                                } else {
                                  Navigator.pop(
                                      context); // Cerrar la ventana emergente
                                }
                              },
                              child: const Text(
                                'Decline',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff2D148F)),
                            ),
                            SizedBox(width: size.width * 0.1),
                            ElevatedButton(
                              onPressed: () {
                                if (palomita == null || !palomita) {
                                  setState(() {
                                    palomita = true;
                                  });
                                  Navigator.pop(
                                      context); // Cerrar la ventana emergente
                                } else {
                                  Navigator.pop(
                                      context); // Cerrar la ventana emergente
                                }
                              },
                              child: const Text(
                                'Accept',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff2D148F)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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

// Testeo apis

// api GET request

Future<Post> fetchPost() async {
  final uri = Uri.parse("http://127.0.0.1:8000/");
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Fallo al cargar el post');
  }
}

// api POST request registrar usuario

Future<Post> createPost(String email, String password, int telefono) async {
  Map<String, dynamic> request = {
    'correo': email,
    'contraseña': password,
    'telefono': telefono,
  };

  final uri = Uri.parse("http://10.0.2.2:8000/users/post");
  final response = await http.post(
    uri,
    body: json.encode(request), // Convierte los datos a formato JSON
    headers: {
      'Content-Type': 'application/json'
    }, // Configura el encabezado 'Content-Type'
  );

  if (response.statusCode == 201) {
    return Post.fromJson(json.decode(response.body));
  } else {
    // detalle de errores
    print('Error en la solicitud:');
    print('Código de estado: ${response.statusCode}');
    print('Cuerpo de la respuesta: ${response.body}');

    throw Exception(
        'Fallo al cargar el post. Código de estado: ${response.statusCode}');
  }
}

// api POST request tipo arma

Future<Post> tipoarmaPost(String nombre) async {
  Map<String, dynamic> request = {
    'nombre': nombre,
  };

  final uri = Uri.parse("http://10.0.2.2:8000/guntipe/post");
  final response = await http.post(
    uri,
    body: json.encode(request), // Convierte los datos a formato JSON
    headers: {
      'Content-Type': 'application/json'
    }, // Configura el encabezado 'Content-Type'
  );

  if (response.statusCode == 201) {
    return Post.fromJson(json.decode(response.body));
  } else {
    // detalle de errores
    print('Error en la solicitud:');
    print('Código de estado: ${response.statusCode}');
    print('Cuerpo de la respuesta: ${response.body}');

    throw Exception(
        'Fallo al cargar el post. Código de estado: ${response.statusCode}');
  }
}

// api PUT request

Future<Post> updatePost(String correo, String contrasenna, int telefono) async {
  Map<String, dynamic> request = {
    'id': "3",
    'correo': correo,
    'contraseña': contrasenna,
    'telefono': telefono
  };
  final uri = Uri.parse("http://127.0.0.1:8000/users/put/3");
  final response = await http.put(uri, body: request);

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Fallo al cargar el post');
  }
}

// api DELETE request

Future<Post?>? deletePost() async {
  final uri = Uri.parse("http://127.0.0.1:8000/users/delete/3");
  final response = await http.delete(uri);

  if (response.statusCode == 200) {
    return null;
  } else {
    throw Exception('Fallo al cargar el post');
  }
}
