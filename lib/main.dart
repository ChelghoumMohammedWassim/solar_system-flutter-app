import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solar_systemapp/DataBase/dbHelper.dart';
import 'package:solar_systemapp/Models/Model.dart';
import 'DataBase/firebase_options.dart';
import 'Frames/MainFrame.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

// for(Planet p in planets){
//   addPlanetToDb(p);
// }
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFrame(),
    );
  }
}