import 'dart:math';
import 'package:flutter/material.dart';

class OrificeCalculatorPage extends StatefulWidget {
  const OrificeCalculatorPage({super.key});

  @override
  State<OrificeCalculatorPage> createState() =>
      _OrificeCalculatorPageState();
}

class _OrificeCalculatorPageState
    extends State<OrificeCalculatorPage> {

  final TextEditingController densityController =
      TextEditingController();

  final TextEditingController dpController =
      TextEditingController();

  final TextEditingController diameterController =
      TextEditingController();

  final TextEditingController cdController =
      TextEditingController(text: '0.61');

  double flow = 0.0;

  void calculateFlow() {

    double density =
        double.tryParse(densityController.text) ?? 1000;

    double dp =
        double.tryParse(dpController.text) ?? 0;

    double diameterMm =
        double.tryParse(diameterController.text) ?? 0;

    double cd =
        double.tryParse(cdController.text) ?? 0.61;

    double diameter =
        diameterMm / 1000;

    double area =
        pi * pow(diameter, 2) / 4;

    flow =
        cd *
        area *
        sqrt((2 * dp) / density);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orifice Calculator',
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),

          child: Column(
            children: [

              const Text(
                'Orifice Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: densityController,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Density (kg/m³)',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: dpController,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Differential Pressure (Pa)',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: diameterController,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Orifice Diameter (mm)',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: cdController,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Discharge Coefficient',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: calculateFlow,
                child: const Text(
                  'Calculate Flow',
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Flow = ${flow.toStringAsFixed(6)} m³/s',
                style: const TextStyle(
                  fontSize: 22,
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