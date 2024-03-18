import 'dart:io';
import 'package:flutter/material.dart';

class agreements extends StatelessWidget {
  const agreements({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  const Color(0xff2D148F),
      appBar: AppBar(
        backgroundColor:  const Color(0xff2D148F),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close_rounded),
          color: Colors.white,
          iconSize: size.width * 0.07,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Acuerdos Legales',
                style: TextStyle(
                    fontFamily: 'mbold',
                    color: Colors.white,
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
                  'Lorem ipsum dolor sit amet consectetur. Condimentum varius nibh a tincidunt tincidunt a porttitor facilisis. Sapien diam neque mauris massa accumsan. Et ullamcorper egestas non dui nulla pharetra tempor nunc. Urna suspendisse molestie ultricies risus commodo justo augue velit sem.',
                  style: TextStyle(
                      fontFamily: 'mlight',
                      color: Colors.white,
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
