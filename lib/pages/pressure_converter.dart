import 'package:flutter/material.dart';

class PressureConverterPage extends StatefulWidget {
  const PressureConverterPage({super.key});

  @override
  State<PressureConverterPage> createState() =>
      _PressureConverterPageState();
}

class _PressureConverterPageState
    extends State<PressureConverterPage> {
  final TextEditingController valueController =
      TextEditingController();

  String fromUnit = 'Bar';
  String toUnit = 'PSI';

  double result = 0.0;

  final Map<String, double> factors = {
    'Pa': 1.0,
    'hPa': 100.0,
    'kPa': 1000.0,
    'MPa': 1000000.0,

    'Bar': 100000.0,
    'mBar': 100.0,

    'PSI': 6894.757,

    'atm': 101325.0,

    'kg/cm²': 98066.5,

    'Torr': 133.322,
    'mmHg': 133.322,

    'inHg': 3386.39,

    'mmH2O': 9.80665,
    'cmH2O': 98.0665,
    'mH2O': 9806.65,

    'inH2O': 249.089,
    'ftH2O': 2989.07,
  };

  void convertPressure() {
    double input =
        double.tryParse(valueController.text) ?? 0.0;

    double pascal =
        input * factors[fromUnit]!;

    double output =
        pascal / factors[toUnit]!;

    setState(() {
      result = output;
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
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [

              const Text(
                'Pressure Converter',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Input Value',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                initialValue: fromUnit,
                decoration: const InputDecoration(
                  labelText: 'From',
                  border: OutlineInputBorder(),
                ),
                items: factors.keys.map((unit) {
                  return DropdownMenuItem(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    fromUnit = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                initialValue: toUnit,
                decoration: const InputDecoration(
                  labelText: 'To',
                  border: OutlineInputBorder(),
                ),
                items: factors.keys.map((unit) {
                  return DropdownMenuItem(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    toUnit = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: convertPressure,
                child: const Text(
                  'Convert',
                ),
              ),

              const SizedBox(height: 30),

              Text(
                '${result.toStringAsFixed(6)} $toUnit',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}