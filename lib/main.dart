import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:reno_bar/dino_game.dart';
import 'package:reno_bar/screens/main_menu.dart';

void main() {


  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(),
    );
  }
}
