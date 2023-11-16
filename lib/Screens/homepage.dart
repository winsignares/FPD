import 'dart:ui';
import 'package:appsemillero/Datos_reportes.dart';
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

var myPosition = LatLng(0, 0);

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Homepage",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: homepageSF());
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
  final _bottomSheetController = TextEditingController();
  PanelController _pc = new PanelController();

  // funciones para traer los datos de los reportes
  List<Datos_reportes> data = <Datos_reportes>[];

  Future<List<Datos_reportes>> getdatareports() async {
    try {
      var uri = Uri.parse("http://10.0.2.2:8000/reports/get");
      var response = await http.get(uri).timeout(Duration(seconds: 90));

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


  //funcion para reporte rapido (abrir camara y tomar foto de evidencia rapido)

  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _pickImage(op) async {
    var pickedFile;

    if (op == 1){
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }


    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
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

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.only(right: 24.0, left: 24.0, top: 40),
      child: Column(children: [
        Expanded(child: myPosition == null
            ? CircularProgressIndicator()
            :ListView.builder(itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1)
                  )
              ),

              child: Column(
                children: [
                  Text(data[index].Barrio),
                  Text(data[index].Fecha),
                ],
              ),

            );
          },)
        ),

      ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xff448493),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Builder(
              builder: (BuildContext innerContext) =>
                  IconButton(
                    onPressed: () async {
                      Scaffold.of(innerContext).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                    ),
                    iconSize: 33,
                  ),
            ),
          ),
        ],
        leading: Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 7),
                child: IconButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new updatedata();
                      }),
                    );
                  },
                  icon: Icon(
                    Icons.person,
                  ),
                  iconSize: 33,
                )),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Center(
            child: Stack(children: <Widget>[
              Container(
                child: myPosition == null
                    ? CircularProgressIndicator()
                    : FlutterMap(
                    options: MapOptions(
                      center: myPosition,
                      maxZoom: 18.4,
                      zoom: 18.4,
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
                                return Container(
                                  child: Image.asset(
                                    "assets/logoapp.png",
                                  ),
                                );
                              })
                        ],
                      )
                    ]),
              ),

              Positioned(
                bottom: 10,
                // Puedes ajustar la distancia desde la parte inferior
                right: -70,
                // Puedes ajustar la distancia desde la derecha
                child: myPosition == null
                    ? SizedBox.shrink()
                    : Container(
                  padding: EdgeInsets.all(90),
                  child: IconButton(
                    onPressed: () async {
                      getCurrentLocation();
                      if (myPosition != null) {
                        mapController.move(myPosition!,
                            18.5); // Center the map on myPosition
                      }
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Color(0xff448493),
                      size: 50,
                    ),
                    iconSize: 50,
                  ),
                ),
              ),
              Positioned(
                child: myPosition == null
                    ? CircularProgressIndicator()
                    : SlidingUpPanel(
                  controller: _pc,
                  renderPanelSheet: false,
                  panel: _floatingPanel(),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: myPosition == null
                    ? SizedBox.shrink()
                    : Container(
                  height: 60.0,
                  color: Color(0xff448493),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.library_books_rounded,
                            color: Color.fromRGBO(255, 255, 255, 1.0)),
                        iconSize: 40,
                        onPressed: () {
                          //abrir y cerrar reportes

                          if (_pc.isPanelClosed) {
                            _pc.open();
                          } else {
                            _pc.close();
                          }

                        },
                      ),
                      IconButton(
                        icon: Icon(
                            CupertinoIcons.exclamationmark_octagon_fill),
                        color: Color(0xffffffff),
                        iconSize: 40,
                        onPressed: () {
                          getdatareports();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(

                bottom: 0,
                left: 0,
                right: 0,
                child: myPosition == null
                    ? SizedBox.shrink()
                    : Container(
                  margin: EdgeInsets.only(bottom: 30),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xff448493),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: IconButton(
                    icon: Icon(CupertinoIcons.camera_fill),
                    color: Color(0xffffffff),
                    iconSize: 35,
                    onPressed: () {
                      _pickImage(1);
                      /*Navigator.of(context).push(
                        MaterialPageRoute<Null>(builder: (BuildContext context) {
                          return new generarreporte();
                        }),
                      );
                      */
                      //aca mandaria a la pantalla de generar reportes con la imagen de la evidencia
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}




