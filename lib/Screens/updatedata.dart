import 'package:appsemillero/Screens/homepage.dart';
import 'package:appsemillero/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:appsemillero/post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class updatedata extends StatelessWidget {
  const updatedata({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpdateData',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // A widget which will be started on application startup
      home: const UpdateData(),
    );
  }
}

class UpdateData extends StatefulWidget {
  static const routeName = 'UpdateData';

  const UpdateData({Key? key}) : super(key: key);

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _pickImage(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  opciones(context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(size.height * 0.01),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(size.height * 0.025),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: size.height * 0.0007,
                                  color: Colors.grey))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Tomar una foto',
                                style: TextStyle(
                                    color: const Color(0xff2D148F),
                                    fontSize: size.width * 0.04,
                                    fontFamily: 'mmedium')),
                          ),
                          Icon(
                            Icons.camera_alt_rounded,
                            color: const Color(0xff2D148F),
                            size: size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(size.height * 0.025),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Seleccionar una foto',
                                style: TextStyle(
                                    color: const Color(0xff2D148F),
                                    fontSize: size.width * 0.04,
                                    fontFamily: 'mmedium')),
                          ),
                          Icon(
                            Icons.image,
                            color: const Color(0xff2D148F),
                            size: size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String _name = '';
  String _lastName = '';
  int _id = 0;
  int _phoneNumber = 0;
  String _user = '';
  String _mail = '';
  int _intValue = 0;
  String _stringValue = '';
  bool _isValid = true;

  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();
  final TextEditingController _textController4 = TextEditingController();
  final TextEditingController _textControllerDigit2 = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<Post?>? post;

  void updatealldata() {
    setState(() {
      post = updateinfoPost(
          _textController1.text, _textController2.text, _textController4.text);
    });
  }

  Future<Post> updateinfoPost(
      String nombre, String apellido, String usuario) async {
    Map<String, dynamic> request = {
      'nombre': nombre,
      'apellido': apellido,
      'usuario': usuario
    };
    final uri = Uri.parse("http://10.0.2.2:8000/users/put/1");
    final response = await http.put(
      uri, body: json.encode(request), // Convierte los datos a formato JSON
      headers: {
        'Content-Type': 'application/json'
      }, // Configura el encabezado 'Content-Type'
    );

    if (response.statusCode == 200) {
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

  void validateEmail(String input) {
    setState(() {
      if (input.contains('@')) {
        _mail = input;
        _isValid = true;
      } else {
        _mail = '';
        _isValid = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff2D148F),
        appBar: AppBar(
          backgroundColor: const Color(0xff2D148F),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const homepage();
                }),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.white,
            iconSize: size.width * 0.05,
          ),
          title: Text(
            'Actualizar informacion',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'mmedium',
                fontSize: ((size.width + size.height) / 2) * 0.035),
          ),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff2D148F),
              ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: size.height * 0.1,
                        backgroundColor: const Color(0xff2D148F),
                        backgroundImage: _imageFile != null
                            ? FileImage(
                                _imageFile!) // Mostrar imagen seleccionada si hay una
                            : null, // Si no hay imagen, muestra el icono account
                        child: _imageFile == null
                            ? Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: size.height * 0.2,
                              )
                            : null,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              opciones(context);
                            },
                            child: Text(
                              "Subir imagen",
                              style: TextStyle(
                                fontSize:
                                    ((size.width + size.height) / 2 * 0.023),
                                fontFamily: "mmedium",
                                color: const Color(0xff2D148F),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.035,
                                ),
                                backgroundColor: const Color(0xffffffff),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.65,
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(size.height * 0.025),
                              ),
                            ),
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.width * 0.05),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextField(
                                          controller: _textController1,
                                          decoration: InputDecoration(
                                              labelText: "Nombre",
                                              labelStyle: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontFamily: "mmedium",
                                              )),
                                          onChanged: (namevalue) {
                                            setState(() {
                                              _name = namevalue;
                                            });
                                          },
                                        ),
                                        TextField(
                                          controller: _textController2,
                                          decoration: InputDecoration(
                                              labelText: "Apellido",
                                              labelStyle: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontFamily: "mmedium",
                                              )),
                                          onChanged: (newvalue) {
                                            setState(() {
                                              _lastName = newvalue;
                                            });
                                          },
                                        ),
                                        TextField(
                                          controller: _textController4,
                                          decoration: InputDecoration(
                                              labelText: "Usuario",
                                              labelStyle: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontFamily: "mmedium",
                                              )),
                                        ),
                                        TextField(
                                          controller: _textControllerDigit2,
                                          decoration: InputDecoration(
                                              labelText: "Contrasenna",
                                              labelStyle: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontFamily: "mmedium",
                                              )),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          onChanged: (newvalue) {
                                            setState(() {
                                              _id = int.parse(newvalue);
                                            });
                                          },
                                        ),
                                        TextField(
                                          enabled: false,
                                          controller: _textController3,
                                          decoration: InputDecoration(
                                              labelText: "Celular",
                                              labelStyle: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontFamily: "mblack",
                                              )),
                                          onChanged: (newvalue) {
                                            setState(() {
                                              _user = newvalue;
                                            });
                                          },
                                        ),
                                        TextField(
                                          enabled: false,
                                          onChanged: validateEmail,
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            labelText: "Email",
                                            labelStyle: TextStyle(
                                              fontSize: size.height * 0.02,
                                              fontFamily: "mblack",
                                            ),
                                            errorText: _isValid
                                                ? null
                                                : 'No es un correo válido',
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Container(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              updatealldata();
                                            },
                                            child: Text(
                                              "Actualizar",
                                              style: TextStyle(
                                                fontSize: ((size.width +
                                                        size.height) /
                                                    2 *
                                                    0.03),
                                                fontFamily: "mregular",
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.1,
                                                ),
                                                backgroundColor:
                                                    const Color(0xff2D148F),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                          ),
                                        ),
                                      ])),
                            ]),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}


// api PUT request actualizar datos

