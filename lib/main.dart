import 'package:flutter/material.dart';
import 'package:xo/loginScreen.dart';
import 'package:xo/xo_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: loginScreen.routeName,
      routes: {
        xoGame.routeName: (context) => xoGame(),
        loginScreen.routeName: (context) => loginScreen(),
      },
    );
  }
}
