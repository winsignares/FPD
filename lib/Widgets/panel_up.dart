import 'dart:convert';

import 'package:appsemillero/Datos_reportes.dart';
import 'package:appsemillero/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class panelup extends StatelessWidget {
  const panelup({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0),
      child: Column(children: [
        footer(imagePickerService: ImagePickerService()),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: size.height * 0.1,
                collapsedHeight: size.height * 0.06,
                toolbarHeight: size.height * 0.01,
                backgroundColor: Colors.white,
                pinned: true,
                // actions para ocultar un icon menu que sale en la parte derecha, solventar luego
                actions: const [Padding(padding: EdgeInsets.only(left: 0, ))],
                flexibleSpace: FlexibleSpaceBar(
                    
                    titlePadding: EdgeInsets.only(bottom: size.height * 0.02, left: size.width * 0.05),
                    title: Text(
                      'Historial de reportes',
                      style: TextStyle(
                        fontFamily: 'msbold',
                        color: const Color(0xff2D148F),
                        fontSize: size.height * 0.02,
                      ),
                    ),
                    
                    ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(size.width * 0.03),
                      margin: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.06,
                          bottom: size.height * 0.03),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: size.width * 0.05,
                                offset: Offset(
                                    size.width * 0.015, size.width * 0.03)),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reporte 01',
                            style: TextStyle(
                                fontFamily: 'mmedium',
                                color: const Color(0xff2D148F),
                                fontSize: size.height * 0.02),
                          ),
                          SizedBox(
                            height: size.height * 0.008,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Calle #46-53 Portal del prado',
                                style: TextStyle(
                                    fontFamily: 'mlight',
                                    color: const Color(0xff2D148F),
                                    fontSize: size.height * 0.02),
                              ),
                              Icon(
                                Icons.location_on_sharp,
                                color: const Color(0xffAE4141),
                                size: size.height * 0.033,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
