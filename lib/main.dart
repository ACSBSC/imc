import 'package:flutter/material.dart';
import 'PantallaIMC.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: PantallaIMCStateful(),//Llama a tu Stateful,

      debugShowCheckedModeBanner: false,
    );
  }
}