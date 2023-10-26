import 'package:appsemillero/Screens/homepage.dart';
import 'package:appsemillero/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';

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
      home: UpdateData(),
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

  Future<void> _pickImage(ImageSource source) async {

    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    final picker = ImagePicker();
    if (source == ImageSource.camera && Platform.isAndroid) {
      print('La cámara no está disponible en este dispositivo.');
      return;
    }
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(width: 1, color: Colors.grey))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Tomar una foto',
                                style: TextStyle(
                                    color: Color(0xff448493),
                                    fontSize: 16,
                                    fontFamily: 'mmedium')),
                          ),
                          Icon(
                            Icons.camera_alt_rounded,
                            color: Color(0xff448493),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                          context); // Cierra el diálogo antes de seleccionar la imagen
                      _pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Seleccionar una foto',
                                style: TextStyle(
                                    color: Color(0xff448493),
                                    fontSize: 16,
                                    fontFamily: 'mmedium')),
                          ),
                          Icon(
                            Icons.image,
                            color: Color(0xff448493),
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
  final TextEditingController _textControllerDigit1 = TextEditingController();
  final TextEditingController _textControllerDigit2 = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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

    return Scaffold(
      body: SingleChildScrollView (
        physics: NeverScrollableScrollPhysics(),
        child:
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff448493),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10, top: 28),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 34,
                              color: Color(0xffffffff),
                            ),
                            onPressed: () {
                              //Codigo para pasar de pantallas
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contxt) =>
                                        homepage()), // Nombre de la siguiente ruta
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,


                              child: Text(
                                'Actualiza tus datos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'mmedium',
                                    color: Color(0xffffffff),
                                    fontSize: 23),

                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Column(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor:
                          Color(0xff448493), // Color de fondo estandarizado
                          backgroundImage: _imageFile != null
                              ? FileImage(
                              _imageFile!) // Mostrar imagen seleccionada si hay una
                              : null, // Si no hay imagen, mostrará el color de fondo estandarizado
                          child: _imageFile == null
                              ? Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 150,
                          ) // Icono estandarizado si no hay imagen
                              : null, // Si hay imagen, no mostrar el icono
                        ),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  opciones(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff448493),
                                  elevation: 0,
                                  textStyle: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: 'mmedium',
                                      fontSize: 15),
                                ),
                                child: Text('Subir foto'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.only(
                                    top: 0, right: 30, bottom: 20, left: 30),

                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 10, right: 10),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 15),
                                            TextField(
                                              controller: _textController1,
                                              decoration: const InputDecoration(
                                                  labelText: "Nombre",
                                                  labelStyle: TextStyle(fontSize: 18)),
                                              onChanged: (namevalue) {
                                                setState(() {
                                                  _name = namevalue;
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            const SizedBox(height: 5),
                                            TextField(
                                              controller: _textController2,
                                              decoration: const InputDecoration(
                                                  labelText: "Apellido",
                                                  labelStyle: TextStyle(fontSize: 18)),
                                              onChanged: (newvalue) {
                                                setState(() {
                                                  _lastName = newvalue;
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            TextField(
                                              controller: _textControllerDigit1,
                                              decoration: const InputDecoration(
                                                  labelText: "C.C",
                                                  labelStyle: TextStyle(fontSize: 18)),
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              onChanged: (newvalue) {
                                                setState(() {
                                                  _id = int.parse(newvalue);
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            TextField(
                                              controller: _textControllerDigit2,
                                              decoration: const InputDecoration(
                                                  labelText: "Teléfono",
                                                  labelStyle: TextStyle(fontSize: 18)),
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              onChanged: (newvalue) {
                                                setState(() {
                                                  _id = int.parse(newvalue);
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 7),
                                            TextField(
                                              enabled: false,
                                              controller: _textController3,
                                              decoration: const InputDecoration(
                                                  labelText: "Usuario",
                                                  labelStyle: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 18)),
                                              onChanged: (newvalue) {
                                                setState(() {
                                                  _user = newvalue;
                                                });
                                              },

                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            const SizedBox(height: 7),
                                            TextField(
                                              enabled: false,
                                              onChanged: validateEmail,
                                              controller: _emailController,
                                              decoration: InputDecoration(
                                                labelText: "Email",
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                                errorText: _isValid
                                                    ? null
                                                    : 'No es un correo válido',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                  child:
                                                  ElevatedButton(

                                                    onPressed: () {},
                                                    child: Text('Actualizar',
                                                        style: TextStyle(fontSize: 18)),

                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Color(0xff448493),

                                                      elevation: 0,
                                                      textStyle: TextStyle(
                                                          color: Color(0xffffffff),
                                                          fontFamily: 'mmedium',
                                                          fontSize: 15),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15)),
                                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                                    ),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ])),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
              ],
            ),
          ),

      )
    );
  }
}