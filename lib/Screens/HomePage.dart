import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: HomePageSrc(),);
  }
}

class HomePageSrc extends StatefulWidget {
  const HomePageSrc({super.key});

  @override
  State<HomePageSrc> createState() => _HomePageSrcState();
}

class _HomePageSrcState extends State<HomePageSrc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: const Color(0xff448493), leading: IconButton(icon: const Icon(Icons.account_circle, size: 30), onPressed: (){},), actions:[Container(margin: const EdgeInsets.only(right: 5), child: IconButton(onPressed: (){}, icon: const Icon(Icons.settings, size: 30,)),)]));
  }
}