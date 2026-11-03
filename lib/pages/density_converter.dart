import 'package:flutter/material.dart';

class DensityConverterPage extends StatefulWidget {
  const DensityConverterPage({super.key});

  @override
  State<DensityConverterPage> createState() =>
      _DensityConverterPageState();
}

class _DensityConverterPageState
    extends State<DensityConverterPage> {

  final TextEditingController valueController =
      TextEditingController();

  String fromUnit = 'kg/m³';
  String toUnit = 'g/cm³';

  double result = 0.0;

  final Map<String, double> factors = {

    // Basis = kg/m³

    'kg/m³': 1.0,

    'g/cm³': 1000.0,

    'g/ml': 1000.0,

    'kg/l': 1000.0,

    'g/l': 1.0,

    'mg/l': 0.001,

    'lb/ft³': 16.018463,

    'lb/in³': 27679.9,

    'lb/gal (US)': 119.826,

    'lb/gal (UK)': 99.7763,

    'slug/ft³': 515.379,

    'ton/m³': 1000.0,
  };

  void convertDensity() {

    double input =
        double.tryParse(valueController.text) ?? 0.0;

    double densityBase =
        input * factors[fromUnit]!;

    double output =
        densityBase / factors[toUnit]!;

    setState(() {
      result = output;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Density Converter',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [

              const Text(
                'Density Converter',
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
                  labelText: 'Density Value',
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
                onPressed: convertDensity,
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