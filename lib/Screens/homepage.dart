import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:appsemillero/Screens/updatedata.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff448493),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.settings,
              ),
              iconSize: 33,
            ),
          ),
        ],
        leading: Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 7),
                child: IconButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contxt) =>
                              updatedata()), // Nombre de la siguiente ruta
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
      body: Center(
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
            bottom: 10, // Puedes ajustar la distancia desde la parte inferior
            right: -70, // Puedes ajustar la distancia desde la derecha
            child: myPosition == null
                ? SizedBox.shrink()
                : Container(
              padding: EdgeInsets.all(90),
              child: IconButton(
                onPressed: () async {
                  getCurrentLocation();
                  if (myPosition != null) {
                    mapController.move(
                        myPosition!, 18.5); // Center the map on myPosition
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
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: Icon(CupertinoIcons.exclamationmark_octagon_fill),
                    color: Color(0xffffffff),
                    iconSize: 40,
                    onPressed: () {},
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
              onPressed: () {},
            ),
          ),
          ),

        ]),
      ),
    );
  }
}
