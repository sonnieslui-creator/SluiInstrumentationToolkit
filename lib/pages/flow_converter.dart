import 'package:flutter/material.dart';

class FlowConverterPage extends StatefulWidget {
  const FlowConverterPage({super.key});

  @override
  State<FlowConverterPage> createState() =>
      _FlowConverterPageState();
}

class _FlowConverterPageState
    extends State<FlowConverterPage> {

  final TextEditingController valueController =
      TextEditingController();

  String fromUnit = 'm³/h';
  String toUnit = 'l/min';

  double result = 0.0;

  final Map<String, double> factors = {

    // Basis = m³/s

    'm³/s': 1.0,

    'm³/h': 1 / 3600,

    'l/s': 0.001,

    'l/min': 0.001 / 60,

    'l/h': 0.001 / 3600,

    'ft³/s': 0.0283168,

    'ft³/min': 0.0283168 / 60,

    'ft³/h': 0.0283168 / 3600,

    'gal/min (US)': 0.00378541 / 60,

    'gal/h (US)': 0.00378541 / 3600,

    'bbl/day': 0.158987 / 86400,

    'Nm³/h': 1 / 3600,

    'Sm³/h': 1 / 3600,
  };

  void convertFlow() {

    double input =
        double.tryParse(valueController.text) ?? 0;

    double flowBase =
        input * factors[fromUnit]!;

    double output =
        flowBase / factors[toUnit]!;

    setState(() {
      result = output;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flow Converter',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [

              const Text(
                'Flow Converter',
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
                  labelText: 'Flow Value',
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
                onPressed: convertFlow,
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