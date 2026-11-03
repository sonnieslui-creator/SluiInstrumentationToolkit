import 'package:flutter/material.dart';
import 'pages/pressure_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slui Instrumentation Toolkit',
      home: PressureConverterPage(),
    );
  }
}