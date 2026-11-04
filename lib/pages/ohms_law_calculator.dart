import 'package:flutter/material.dart';

class OhmsLawCalculatorPage extends StatefulWidget {
  const OhmsLawCalculatorPage({super.key});

  @override
  State<OhmsLawCalculatorPage> createState() =>
      _OhmsLawCalculatorPageState();
}

class _OhmsLawCalculatorPageState
    extends State<OhmsLawCalculatorPage> {

  final TextEditingController value1Controller =
      TextEditingController();

  final TextEditingController value2Controller =
      TextEditingController();

  String calculationType = 'Voltage (V)';

  double result = 0.0;

  void calculate() {

    double value1 =
        double.tryParse(value1Controller.text) ?? 0;

    double value2 =
        double.tryParse(value2Controller.text) ?? 0;

    switch (calculationType) {

      case 'Voltage (V)':

        result = value1 * value2;
        break;

      case 'Current (A)':

        if (value2 != 0) {
          result = value1 / value2;
        }
        break;

      case 'Resistance (Ω)':

        if (value2 != 0) {
          result = value1 / value2;
        }
        break;
    }

    setState(() {});
  }

  String getLabel1() {

    switch (calculationType) {

      case 'Voltage (V)':
        return 'Current (A)';

      case 'Current (A)':
        return 'Voltage (V)';

      case 'Resistance (Ω)':
        return 'Voltage (V)';
    }

    return '';
  }

  String getLabel2() {

    switch (calculationType) {

      case 'Voltage (V)':
        return 'Resistance (Ω)';

      case 'Current (A)':
        return 'Resistance (Ω)';

      case 'Resistance (Ω)':
        return 'Current (A)';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ohm\'s Law Calculator',
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),

          child: Column(
            children: [

              const Text(
                'Ohm\'s Law Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                initialValue: calculationType,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Calculate',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Voltage (V)',
                    child: Text('Voltage (V)'),
                  ),
                  DropdownMenuItem(
                    value: 'Current (A)',
                    child: Text('Current (A)'),
                  ),
                  DropdownMenuItem(
                    value: 'Resistance (Ω)',
                    child: Text('Resistance (Ω)'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    calculationType = value!;
                  });
                },
              ),

              const SizedBox(height: 10),

              TextField(
                controller: value1Controller,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: getLabel1(),
                  border: const OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: value2Controller,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: getLabel2(),
                  border: const OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: calculate,
                child: const Text(
                  'Calculate',
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Result = ${result.toStringAsFixed(3)}',
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