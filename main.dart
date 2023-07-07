import 'package:application/ActivityAPI.dart';
import 'package:application/JokeAPI.dart';
import 'package:application/api.dart';
import 'package:application/list%20api.dart';
import 'package:application/model%20api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 //
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:JokeAPI(),
    );
   }
}

