import 'dart:io';
import 'package:flutter/material.dart';

class tcscreen extends StatelessWidget {
  const tcscreen ({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor:  const Color(0xffffffff),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close_rounded),
          color: const Color(0xff2D148F),
          iconSize: size.width * 0.07,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Términos y condiciones',
                style: TextStyle(
                    fontFamily: 'mbold',
                    color: const Color(0xff2D148F),
                    fontSize: size.width * 0.05),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: size.height * 0.02),
            
            width: size.width * 0.8,
            height: size.height * 0.8,
            child: ListView(
              children: [
                Text(
                  '1. Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan. Et ullamcorper egestas non dui nulla pharetra tempor nunc. Urna suspendisse molestie ultricies risus commodo justo augue velit sem. 1.1 1.2 1.3 1.4',
                  style: TextStyle(
                      fontFamily: 'mlight',
                      color:  const Color(0xff2D148F),
                      fontSize: size.width * 0.05),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
