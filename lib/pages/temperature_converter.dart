import 'package:flutter/material.dart';

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  State<TemperatureConverterPage> createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState
    extends State<TemperatureConverterPage> {

  final TextEditingController valueController =
      TextEditingController();

  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';

  double result = 0.0;

  final List<String> units = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
  ];

  void convertTemperature() {

    double input =
        double.tryParse(valueController.text) ?? 0.0;

    double celsius = 0.0;

    // Naar Celsius

    switch (fromUnit) {

      case 'Celsius':
        celsius = input;
        break;

      case 'Fahrenheit':
        celsius = (input - 32) * 5 / 9;
        break;

      case 'Kelvin':
        celsius = input - 273.15;
        break;
    }

    // Van Celsius naar doel

    switch (toUnit) {

      case 'Celsius':
        result = celsius;
        break;

      case 'Fahrenheit':
        result = (celsius * 9 / 5) + 32;
        break;

      case 'Kelvin':
        result = celsius + 273.15;
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temperature Converter',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Text(
              'Temperature Converter',
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
                labelText: 'Value',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: fromUnit,
              decoration: const InputDecoration(
                labelText: 'From',
                border: OutlineInputBorder(),
              ),
              items: units.map((unit) {

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
              value: toUnit,
              decoration: const InputDecoration(
                labelText: 'To',
                border: OutlineInputBorder(),
              ),
              items: units.map((unit) {

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
              onPressed: convertTemperature,
              child: const Text(
                'Convert',
              ),
            ),

            const SizedBox(height: 30),

            Text(
              '${result.toStringAsFixed(3)} $toUnit',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}