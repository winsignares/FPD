import 'dart:ui';
import 'package:appsemillero/Datos_reportes.dart';
import 'package:appsemillero/Screens/agreements.dart';
import 'package:appsemillero/Screens/login.dart';
import 'package:appsemillero/Screens/report.dart';
import 'package:appsemillero/Screens/tcscreen.dart';
import 'package:appsemillero/Widgets/panel_up.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:appsemillero/Screens/updatedata.dart';
import 'dart:convert';
import 'package:appsemillero/post.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

const MAPBOX_ACCESS_TOKEN =
    "pk.eyJ1Ijoiam9qbWEiLCJhIjoiY2xuaHN3eWF1MTZ4MzJscmlwcGJtdGhoaSJ9.KI50YBpW_GOQZb9ZUlfTqQ";

var myPosition = const LatLng(0, 0);

class ImagePickerService {
  File? _imageFile;
  final picker = ImagePicker();

  Future<void> pickImage(int op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }

    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
    }
  }

  File? get imageFile => _imageFile;
}

PanelController _pc = new PanelController();

class footer extends StatelessWidget {
  final ImagePickerService imagePickerService;

  const footer({Key? key, required this.imagePickerService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff2D148F),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      padding: EdgeInsets.only(bottom: size.height * 0.003),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              onPressed: () {
                if (_pc.isPanelClosed) {
                  _pc.open();
                } else {
                  _pc.close();
                }
              },
              icon: Icon(
                Icons.history_rounded,
                color: Colors.white,
                size: size.height * 0.055,
              ),
            ),
          ]),
          Column(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
                onPressed: () {
                  imagePickerService.pickImage(1);
                },
                icon: Icon(
                  CupertinoIcons.camera_circle_fill,
                  color: Colors.white,
                  size: size.height * 0.055,
                )),
          ]),
          Column(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contxt) => const reportscreen()),
                  );
                },
                icon: Icon(
                  CupertinoIcons.exclamationmark_circle_fill,
                  color: Colors.white,
                  size: size.height * 0.055,
                )),
          ]),
        ],
      ),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Homepage",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const homepageSF());
  }
}

class homepageSF extends StatefulWidget {
  const homepageSF({super.key});

  @override
  State<homepageSF> createState() => _homepageSFState();
}

class _homepageSFState extends State<homepageSF> {
  MapController mapController = MapController();
  LatLng? myPosition;
  double lat = 0;
  double lon = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // funciones para traer los datos de los reportes
  List<Datos_reportes> data = <Datos_reportes>[];

  Future<List<Datos_reportes>> getdatareports() async {
    try {
      var uri = Uri.parse("http://10.0.2.2:8000/reports/get");
      var response = await http.get(uri).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        var jsonDatos = jsonDecode(response.body);
        var registros = <Datos_reportes>[];

        for (var dato in jsonDatos) {
          registros.add(Datos_reportes.fromJson(dato));
        }

        return registros;
      } else {
        // Handle other HTTP status codes if needed
        print("HTTP Status Code: ${response.statusCode}");
        return <Datos_reportes>[];
      }
    } catch (error) {
      print("Error: $error");
      return <Datos_reportes>[];
    }
  }

  // funciones para la posicion
  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("error");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await determinePosition();
    setState(() {
      myPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
    getdatareports().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xff2D148F),
        actions: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.02),
            child: Builder(
              builder: (BuildContext innerContext) => IconButton(
                onPressed: () async {
                  Scaffold.of(innerContext).openEndDrawer();
                },
                icon: const Icon(
                  Icons.menu_open_rounded,
                  color: Colors.white,
                ),
                iconSize: size.height * 0.04,
              ),
            ),
          ),
        ],
        leading: Container(
            padding: EdgeInsets.only(left: size.width * 0.02),
            child: IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const updatedata()),
                );
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              iconSize: size.height * 0.04,
            )),
      ),
      endDrawer: Drawer(
        shape: const Border(bottom: BorderSide.none, top: BorderSide.none),
        width: size.width * 0.7,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: Icon(
                Icons.account_circle,
                color: const Color(0xff2D148F),
                size: size.height * 0.2,
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return const updatedata();
                    }),
                  );
                },
                child: Text(
                  "Editar perfil",
                  style: TextStyle(
                    fontSize: ((size.width + size.height) / 2 * 0.025),
                    fontFamily: "mmedium",
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.035,
                        vertical: size.height * 0.000),
                    backgroundColor: const Color(0xff2D148F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.025, bottom: size.height * 0.005),
              child: Text(
                'User Name',
                style: TextStyle(
                  fontSize: ((size.width + size.height) / 2 * 0.025),
                  fontFamily: "mregular",
                  color: const Color(0xff2D148F),
                ),
              ),
            ),
            Divider(
              color: const Color(0xffD9D9D9),
              indent: size.width * 0.1,
              endIndent: size.width * 0.1,
              thickness: 1.5,
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dark Mode:',
                  style: TextStyle(
                    fontSize: ((size.width + size.height) / 2 * 0.025),
                    fontFamily: "mmedium",
                    color: const Color(0xff2D148F),
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Switch(
                  activeColor: const Color(0xff2D148F),
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                    // Aquí puedes manejar la lógica cuando cambia el estado del switch
                  },
                ),
              ],
            ),
            SizedBox(height: size.height * 0.04),
            Container(
                margin: EdgeInsets.only(top: size.height * 0.025),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const agreements()),
                    );
                  },
                  child: Text(
                    'Informacion legal',
                    style: TextStyle(
                      fontSize: ((size.width + size.height) / 2 * 0.025),
                      fontFamily: "msbold",
                      color: const Color(0xff939393),
                    ),
                  ),
                )),
            Divider(
              color: const Color(0xff939393),
              indent: size.width * 0.18,
              endIndent: size.width * 0.18,
              thickness: 1.5,
            ),
            Container(
                margin: EdgeInsets.only(top: size.height * 0.025),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const tcscreen()),
                    );
                  },
                  child: Text(
                    'Terminos & condiciones',
                    style: TextStyle(
                      fontSize: ((size.width + size.height) / 2 * 0.025),
                      fontFamily: "msbold",
                      color: const Color(0xff939393),
                    ),
                  ),
                )),
            Divider(
              color: const Color(0xff939393),
              indent: size.width * 0.15,
              endIndent: size.width * 0.15,
              thickness: 1.5,
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                      ),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff2D148F))),
                    ),
                  ),
                  Text(
                    'Rate us',
                    style: TextStyle(
                      fontSize: ((size.width + size.height) / 2 * 0.025),
                      fontFamily: "mregular",
                      color: const Color(0xff939393),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute<Null>(
                                builder: (BuildContext context) {
                          return const logscreen();
                        }));
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff2D148F))),
                    ),
                  ),
                  Text(
                    'Salir',
                    style: TextStyle(
                      fontSize: ((size.width + size.height) / 2 * 0.025),
                      fontFamily: "mregular",
                      color: const Color(0xff939393),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.025, bottom: size.height * 0.005),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: ((size.width + size.height) / 2 * 0.025),
                  fontFamily: "mmedium",
                  color: const Color(0xff939393),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SlidingUpPanel(
        controller: _pc,
        backdropEnabled: true,
        minHeight: size.height * 0.068,
        maxHeight: size.height * 0.6,
        color: Colors.transparent,
        panel: const panelup(),
        body: Stack(children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: myPosition == null
                ? const CircularProgressIndicator()
                : FlutterMap(
                    options: MapOptions(
                      center: myPosition,
                      maxZoom: 18,
                      zoom: size.width * 0.045,
                    ),
                    mapController: mapController,
                    nonRotatedChildren: [
                        TileLayer(
                          urlTemplate:
                              'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                          additionalOptions: const {
                            'accessToken': MAPBOX_ACCESS_TOKEN,
                            'id': 'mapbox/streets-v12'
                          },
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                                point: myPosition!,
                                builder: (context) {
                                  return Image.asset(
                                    "assets/purplelogoapp.png",
                                  );
                                })
                          ],
                        )
                      ]),
          ),
          Positioned(
            bottom: size.height * 0.12,
            // Puedes ajustar la distancia desde la parte inferior
            right: -size.width * 0.18,
            // Puedes ajustar la distancia desde la derecha
            child: myPosition == null
                ? const SizedBox.shrink()
                : Container(
                    margin: EdgeInsets.all(size.width * 0.2),
                    child: IconButton(
                      onPressed: () async {
                        getCurrentLocation();
                        if (myPosition != null) {
                          mapController.move(myPosition!,
                              18.5); // Center the map on myPosition
                        }
                      },
                      icon: const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xff2D148F),
                        size: 50,
                      ),
                      iconSize: 50,
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
