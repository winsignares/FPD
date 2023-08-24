import 'package:flutter/material.dart';
import 'package:appsemillero/Screens/login.dart';
import 'package:appsemillero/Screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(loginscreen());
}