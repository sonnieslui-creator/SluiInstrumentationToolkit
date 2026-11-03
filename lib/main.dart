import 'package:flutter/material.dart';
import 'pages/pressure_converter.dart';
import 'pages/temperature_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slui Instrumentation Toolkit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showComingSoon(
    BuildContext context,
    String title,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title is nog in ontwikkeling'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Slui Instrumentation Toolkit',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const PressureConverterPage(),
                  ),
                );
              },
              child: const Text(
                'Pressure Converter',
              ),
            ),

const SizedBox(height: 10),

ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const TemperatureConverterPage(),
      ),
    );
  },
  child: const Text(
    'Temperature Converter',
  ),
),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                showComingSoon(
                  context,
                  'Flow Converter',
                );
              },
              child: const Text(
                'Flow Converter',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                showComingSoon(
                  context,
                  'Density Converter',
                );
              },
              child: const Text(
                'Density Converter',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                showComingSoon(
                  context,
                  '4-20mA Calculator',
                );
              },
              child: const Text(
                '4-20mA Calculator',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                showComingSoon(
                  context,
                  'Ohm\'s Law Calculator',
                );
              },
              child: const Text(
                'Ohm\'s Law Calculator',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                showComingSoon(
                  context,
                  'Orifice Calculator',
                );
              },
              child: const Text(
                'Orifice Calculator',
              ),
            ),
          ],
        ),
      ),
    );
  }
}