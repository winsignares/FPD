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
        home: regscreen());
  }
}

class regscreen extends StatefulWidget {
  const regscreen({super.key});

  @override
  State<regscreen> createState() => _regscreenState();
}

class _regscreenState extends State<regscreen> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
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
                    margin: EdgeInsets.only(right: 100),
                    decoration: BoxDecoration(
                      color: Color(0xff448493),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(400)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              child: Text(
                "Sign up",
                style: TextStyle(
                    fontFamily: "mmedium",
                    fontSize: 25,
                    color: Color(0xff448493)),
              ),
            ),
            Container(
                margin:
                    EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 15),
                padding: EdgeInsets.only(left: 30, right: 15),
                decoration: BoxDecoration(
                    color: Color(0xffEAEAEA),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                    controller: emailr,
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
                margin:
                    EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 15),
                padding: EdgeInsets.only(left: 30, right: 15),
                decoration: BoxDecoration(
                    color: Color(0xffEAEAEA),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                    controller: passwordr,
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
                margin:
                    EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 15),
                padding: EdgeInsets.only(left: 30, right: 15),
                decoration: BoxDecoration(
                    color: Color(0xffEAEAEA),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phone_numberr,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
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
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 18),
              child: ElevatedButton(
                onPressed: () {
                  //verifica que se hayan leido los terminos y condiciones y esten todos los campos requeridos

                  registerdata();
                },
                child: Text(
                  "REGISTER",
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
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 60, right: 60, top: 30),
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
                    iconSize: 50,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () async {
                      await signInWithGoogle();
                    },
                    icon: Image.asset("assets/gmaillogo.png", width: 50),
                    iconSize: 50,
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 100, right: 100, top: 20),
              alignment: Alignment.bottomCenter,
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
      await _storage.write(key: 'phone_number', value: phone_numbertemp.toString());
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
            title: Text('Warning'),
            content: Text('You need to review the T&C and fill all places.'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff448493),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {
                  Navigator.of(context).pop();
                  tacwindow;
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
    }
  }

  void tacwindow(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Terms and Conditions",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'mbold',
                        color: Color(0xff448493)),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      Text(
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
                            fontFamily: 'mlight', color: Color(0xff448493)),
                      ),
                      Container(
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
                              child: Text('Decline'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff448493)),
                            ),
                            SizedBox(width: 50),
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
                              child: Text('Accept'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff448493)),
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
