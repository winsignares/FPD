import 'package:appsemillero/Screens/homepage.dart';
import 'package:appsemillero/Screens/login.dart';
import 'package:flutter/material.dart';

int estrato = 0;
int afectados = 1;
String dropdownValue = 'Selecciona una opcion';

class reportscreen extends StatelessWidget {
  const reportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "report",
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const repscreen());
  }
}

class repscreen extends StatefulWidget {
  const repscreen({super.key});

  @override
  State<repscreen> createState() => _repscreenState();
}

class _repscreenState extends State<repscreen> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2D148F),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new homepage();
                }),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.white,
            iconSize: size.width * 0.05,
          ),
          title: Text(
            'Generar reporte',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'mmedium',
                fontSize: ((size.width + size.height) / 2) * 0.035),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        ),
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.05,
                      top: size.height * 0.02,
                      bottom: size.height * 0.02,
                      right: size.width * 0.01),
                  child: Text('Informacion barrio',
                      style: TextStyle(
                          fontFamily: 'msbold',
                          color: const Color(0xff2D148F),
                          fontSize: ((size.width + size.height) / 2) * 0.03)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.001,
                  width: size.width * 0.43,
                  color: const Color(0xff2D148F),
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        margin: EdgeInsets.only(top: size.height * 0.005),
                        width: size.width * 0.9,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: size.width * 0.003,
                              color: const Color(0xff2D148F)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          alignment: Alignment.centerRight,
                          style: TextStyle(
                              color: const Color(0xff2D148F),
                              fontFamily: 'mlight',
                              fontSize:
                                  ((size.width + size.height) / 2) * 0.027),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue:
                              newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<String>(
                                value: 'Selecciona una opcion',
                                child: Text('Selecciona una opcion')),
                            DropdownMenuItem<String>(
                                value: '7 de abril', child: Text('7 de abril')),
                            DropdownMenuItem<String>(
                                value: 'La fe', child: Text('La fe')),
                            DropdownMenuItem<String>(
                                value: 'Barrio abajo',
                                child: Text('Barrio abajo')),
                          ],
                        )),
                    Positioned(
                      left: size.width * 0.01,
                      bottom: size.height * 0.04,
                      width: size.width * 0.17,
                      height: size.height * 0.02,
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        color: Colors.white,
                        child: Text(
                          'Barrio',
                          style: TextStyle(
                              color: const Color(0xff2D148F),
                              fontSize: ((size.width + size.height) / 2) * 0.02,
                              fontFamily: 'mxlight'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              left: size.width * 0.03,
                              right: size.width * 0.02),
                          margin: EdgeInsets.only(top: size.height * 0.005),
                          width: size.width * 0.3,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: size.width * 0.003,
                                color: const Color(0xff2D148F)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              /*IconButton(onPressed: (){}, icon: Icon(Icons.add),color: Color(0xff2D148F),iconSize: ((size.width + size.height) / 2) * 0.03,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove), color: Color(0xff2D148F),iconSize: ((size.width + size.height) / 2) * 0.03,),
                            */
                              Expanded(
                                child: Text(
                                  estrato.toString(),
                                  style: TextStyle(
                                      color: const Color(0xff2D148F),
                                      fontFamily: 'mlight',
                                      fontSize:
                                          ((size.width + size.height) / 2) *
                                              0.03),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (estrato >= 1) {
                                      estrato--;
                                    }
                                    print(estrato);
                                  });
                                },
                                child: Container(
                                  child: Icon(Icons.remove,
                                      color: const Color(0xff2D148F),
                                      size: ((size.width + size.height) / 2) *
                                          0.03),
                                ),
                              ),
                              VerticalDivider(
                                color: const Color(0xff2D148F),
                                indent: size.height * 0.01,
                                endIndent: size.height * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (estrato <= 5) {
                                      estrato++;
                                    }
                                  });
                                },
                                child: Container(
                                  //
                                  child: Icon(Icons.add,
                                      color: const Color(0xff2D148F),
                                      size: ((size.width + size.height) / 2) *
                                          0.03),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.01,
                          bottom: size.height * 0.04,
                          width: size.width * 0.19,
                          height: size.height * 0.02,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            color: Colors.white,
                            child: Text(
                              'Estrato',
                              style: TextStyle(
                                  color: const Color(0xff2D148F),
                                  fontSize:
                                      ((size.width + size.height) / 2) * 0.02,
                                  fontFamily: 'mxlight'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: size.width * 0.04),
                          margin: EdgeInsets.only(top: size.height * 0.005),
                          width: size.width * 0.55,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: size.width * 0.003,
                                color: const Color(0xff2D148F)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            alignment: Alignment.centerRight,
                            style: TextStyle(
                                color: const Color(0xff2D148F),
                                fontFamily: 'mlight',
                                fontSize:
                                    ((size.width + size.height) / 2) * 0.026),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue:
                                newValue!;
                              });
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                  value: 'Selecciona una opcion',
                                  child: Text('Selecciona una opcion')),
                              DropdownMenuItem<String>(
                                  value: 'Malambo', child: Text('Malambo')),
                              DropdownMenuItem<String>(
                                  value: 'Barranquilla',
                                  child: Text('Barranquilla')),
                              DropdownMenuItem<String>(
                                  value: 'Soledad', child: Text('Soledad')),
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.01,
                          bottom: size.height * 0.04,
                          width: size.width * 0.23,
                          height: size.height * 0.02,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            color: Colors.white,
                            child: Text(
                              'Municipio',
                              style: TextStyle(
                                  color: const Color(0xff2D148F),
                                  fontSize:
                                      ((size.width + size.height) / 2) * 0.02,
                                  fontFamily: 'mxlight'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.05,
                          top: size.height * 0.02,
                          bottom: size.height * 0.02,
                          right: size.width * 0.01),
                      child: Text('Informacion delito',
                          style: TextStyle(
                              fontFamily: 'msbold',
                              color: const Color(0xff2D148F),
                              fontSize:
                                  ((size.width + size.height) / 2) * 0.03)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.001,
                      width: size.width * 0.43,
                      color: const Color(0xff2D148F),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      margin: EdgeInsets.only(top: size.height * 0.005),
                      width: size.width * 0.9,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.003,
                            color: const Color(0xff2D148F)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Escribe aqui...",
                          hintStyle: TextStyle(
                            fontFamily: "mxlight",
                            fontSize: ((size.width + size.height) / 2 * 0.025),
                            color: const Color(0xff676565),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.01,
                      bottom: size.height * 0.04,
                      width: size.width * 0.34,
                      height: size.height * 0.02,
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        color: Colors.white,
                        child: Text(
                          'Modalidad delito',
                          style: TextStyle(
                              color: const Color(0xff2D148F),
                              fontSize: ((size.width + size.height) / 2) * 0.02,
                              fontFamily: 'mxlight'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      margin: EdgeInsets.only(top: size.height * 0.005),
                      width: size.width * 0.9,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.003,
                            color: const Color(0xff2D148F)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Escribe aqui...",
                          hintStyle: TextStyle(
                            fontFamily: "mxlight",
                            fontSize: ((size.width + size.height) / 2 * 0.025),
                            color: const Color(0xff676565),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.01,
                      bottom: size.height * 0.04,
                      width: size.width * 0.23,
                      height: size.height * 0.02,
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        color: Colors.white,
                        child: Text(
                          'Tipo arma',
                          style: TextStyle(
                              color: const Color(0xff2D148F),
                              fontSize: ((size.width + size.height) / 2) * 0.02,
                              fontFamily: 'mxlight'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          margin: EdgeInsets.only(top: size.height * 0.005),
                          width: size.width * 0.425,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: size.width * 0.003,
                                color: const Color(0xff2D148F)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          //row para cuando se annada la fecha de verdad al lado del icono
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: const Color(0xff2D148F),
                                size: ((size.width + size.height) / 2) * 0.03,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.01,
                          bottom: size.height * 0.04,
                          width: size.width * 0.17,
                          height: size.height * 0.02,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            color: Colors.white,
                            child: Text(
                              'Fecha',
                              style: TextStyle(
                                  color: const Color(0xff2D148F),
                                  fontSize:
                                      ((size.width + size.height) / 2) * 0.02,
                                  fontFamily: 'mxlight'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          margin: EdgeInsets.only(top: size.height * 0.005),
                          width: size.width * 0.425,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: size.width * 0.003,
                                color: const Color(0xff2D148F)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          // row para cuando se coloque la hora al lado del icono
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: const Color(0xff2D148F),
                                size: ((size.width + size.height) / 2) * 0.03,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.01,
                          bottom: size.height * 0.04,
                          width: size.width * 0.15,
                          height: size.height * 0.02,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            color: Colors.white,
                            child: Text(
                              'Hora',
                              style: TextStyle(
                                  color: const Color(0xff2D148F),
                                  fontSize:
                                      ((size.width + size.height) / 2) * 0.02,
                                  fontFamily: 'mxlight'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          margin: EdgeInsets.only(top: size.height * 0.005),
                          width: size.width * 0.425,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: size.width * 0.003,
                                color: const Color(0xff2D148F)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: const Color(0xffAE4141),
                                size: ((size.width + size.height) / 2) * 0.03,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.01,
                          bottom: size.height * 0.04,
                          width: size.width * 0.22,
                          height: size.height * 0.02,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            color: Colors.white,
                            child: Text(
                              'Direccion',
                              style: TextStyle(
                                  color: const Color(0xff2D148F),
                                  fontSize:
                                      ((size.width + size.height) / 2) * 0.02,
                                  fontFamily: 'mxlight'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              left: size.width * 0.03,
                              right: size.width * 0.02),
                          margin: EdgeInsets.only(top: size.height * 0.005),
                          width: size.width * 0.425,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: size.width * 0.003,
                                color: const Color(0xff2D148F)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              /*IconButton(onPressed: (){}, icon: Icon(Icons.add),color: Color(0xff2D148F),iconSize: ((size.width + size.height) / 2) * 0.03,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove), color: Color(0xff2D148F),iconSize: ((size.width + size.height) / 2) * 0.03,),
                            */
                              Expanded(
                                child: Text(
                                  afectados.toString(),
                                  style: TextStyle(
                                      color: const Color(0xff2D148F),
                                      fontFamily: 'mlight',
                                      fontSize:
                                          ((size.width + size.height) / 2) *
                                              0.03),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (afectados >= 2) {
                                      afectados--;
                                    }
                                  });
                                },
                                child: Container(
                                  child: Icon(Icons.remove,
                                      color: const Color(0xff2D148F),
                                      size: ((size.width + size.height) / 2) *
                                          0.03),
                                ),
                              ),
                              VerticalDivider(
                                color: const Color(0xff2D148F),
                                indent: size.height * 0.01,
                                endIndent: size.height * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (afectados <= 19) {
                                      afectados++;
                                    }
                                  });
                                },
                                child: Container(
                                  //
                                  child: Icon(Icons.add,
                                      color: const Color(0xff2D148F),
                                      size: ((size.width + size.height) / 2) *
                                          0.03),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.01,
                          bottom: size.height * 0.04,
                          width: size.width * 0.41,
                          height: size.height * 0.02,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            color: Colors.white,
                            child: Text(
                              'Numero de afectados',
                              style: TextStyle(
                                  color: const Color(0xff2D148F),
                                  fontSize:
                                      ((size.width + size.height) / 2) * 0.02,
                                  fontFamily: 'mxlight'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      margin: EdgeInsets.only(top: size.height * 0.005),
                      width: size.width * 0.9,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.003,
                            color: const Color(0xff2D148F)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        alignment: Alignment.centerRight,
                        style: TextStyle(
                            color: const Color(0xff2D148F),
                            fontFamily: 'mlight',
                            fontSize: ((size.width + size.height) / 2) * 0.027),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue:
                            newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem<String>(
                              value: 'Selecciona una opcion',
                              child: Text('Selecciona una opcion')),
                          DropdownMenuItem<String>(
                              value: 'Hombre', child: Text('Hombre')),
                          DropdownMenuItem<String>(
                              value: 'Mujer', child: Text('Mujer')),
                          DropdownMenuItem<String>(
                              value: 'Otro', child: Text('Otro')),
                        ],
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.01,
                      bottom: size.height * 0.04,
                      width: size.width * 0.36,
                      height: size.height * 0.02,
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        color: Colors.white,
                        child: Text(
                          'Genero de victima',
                          style: TextStyle(
                              color: const Color(0xff2D148F),
                              fontSize: ((size.width + size.height) / 2) * 0.02,
                              fontFamily: 'mxlight'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      margin: EdgeInsets.only(top: size.height * 0.005),
                      width: size.width * 0.9,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.003,
                            color: const Color(0xff2D148F)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Escribe aqui...",
                          hintStyle: TextStyle(
                            fontFamily: "mxlight",
                            fontSize: ((size.width + size.height) / 2 * 0.025),
                            color: const Color(0xff676565),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.01,
                      bottom: size.height * 0.04,
                      width: size.width * 0.23,
                      height: size.height * 0.02,
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        color: Colors.white,
                        child: Text(
                          'Tipo zona',
                          style: TextStyle(
                              color: const Color(0xff2D148F),
                              fontSize: ((size.width + size.height) / 2) * 0.02,
                              fontFamily: 'mxlight'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.05,
                          top: size.height * 0.02,
                          bottom: size.height * 0.02,
                          right: size.width * 0.01),
                      child: Text('Evidencia',
                          style: TextStyle(
                              fontFamily: 'msbold',
                              color: const Color(0xff2D148F),
                              fontSize:
                                  ((size.width + size.height) / 2) * 0.03)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.01,
                          top: size.height * 0.02,
                          bottom: size.height * 0.02,
                          right: size.width * 0.01),
                      child: Text('(Opcional)',
                          style: TextStyle(
                              fontFamily: 'mregular',
                              color: const Color(0xff2D148F),
                              fontSize:
                                  ((size.width + size.height) / 2) * 0.03)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.001,
                      width: size.width * 0.38,
                      color: const Color(0xff2D148F),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.height * 0.009),
                  width: size.width * 0.9,
                  height: size.height * 0.05,
                  decoration: const BoxDecoration(
                    color: Color(0xffDBDBDB),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Elegir',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'mlight',
                              fontSize:
                                  ((size.width + size.height) / 2) * 0.025),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2D148F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        'Ningun archivo seleccionado',
                        style: TextStyle(
                            color: const Color(0xff2D148F),
                            fontFamily: 'mxlight',
                            fontSize: ((size.width + size.height) / 2) * 0.020),
                      ),
                      SizedBox(width: size.width * 0.05),
                      const Expanded(
                        child: Icon(
                          Icons.cloud_upload_rounded,
                          color: Color(0xff2D148F),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      margin: EdgeInsets.only(top: size.height * 0.005),
                      width: size.width * 0.9,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.003,
                            color: const Color(0xff2D148F)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Escribe aqui...",
                          hintStyle: TextStyle(
                            fontFamily: "mxlight",
                            fontSize: ((size.width + size.height) / 2 * 0.025),
                            color: const Color(0xff676565),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.01,
                      bottom: size.height * 0.04,
                      width: size.width * 0.26,
                      height: size.height * 0.12,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.05),
                        color: Colors.white,
                        child: Text(
                          'Descripcion',
                          style: TextStyle(
                              color: const Color(0xff2D148F),
                              fontSize: ((size.width + size.height) / 2) * 0.02,
                              fontFamily: 'mxlight'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'REPORTAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'mlight',
                        fontSize: ((size.width + size.height) / 2) * 0.03),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2D148F)),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ],
        )));
  }
}
