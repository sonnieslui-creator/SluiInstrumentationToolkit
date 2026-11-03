import 'package:flutter/material.dart';

class PressureConverterPage extends StatefulWidget {
  const PressureConverterPage({super.key});

  @override
  State<PressureConverterPage> createState() =>
      _PressureConverterPageState();
}

class _PressureConverterPageState
    extends State<PressureConverterPage> {
  final TextEditingController barController =
      TextEditingController();

  double psi = 0.0;

  void convertPressure() {
    double bar =
        double.tryParse(barController.text) ?? 0.0;

    setState(() {
      psi = bar * 14.5038;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pressure Converter',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Bar → PSI',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: barController,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Bar',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: convertPressure,
              child: const Text(
                'Bereken',
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'PSI: ${psi.toStringAsFixed(3)}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}