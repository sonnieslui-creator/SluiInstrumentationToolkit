import 'package:flutter/material.dart';

class CurrentLoopCalculatorPage extends StatefulWidget {
  const CurrentLoopCalculatorPage({super.key});

  @override
  State<CurrentLoopCalculatorPage> createState() =>
      _CurrentLoopCalculatorPageState();
}

class _CurrentLoopCalculatorPageState
    extends State<CurrentLoopCalculatorPage> {

  final TextEditingController lrvController =
      TextEditingController();

  final TextEditingController urvController =
      TextEditingController();

  final TextEditingController currentController =
      TextEditingController();

  final TextEditingController processController =
      TextEditingController();

  double processValue = 0.0;
  double currentOutput = 0.0;
  double percentage = 0.0;

  void currentToProcess() {

    double lrv =
        double.tryParse(lrvController.text) ?? 0;

    double urv =
        double.tryParse(urvController.text) ?? 100;

    double current =
        double.tryParse(currentController.text) ?? 4;

    double span = urv - lrv;

    percentage =
        ((current - 4) / 16) * 100;

    processValue =
        lrv + ((current - 4) / 16) * span;

    setState(() {});
  }

  void processToCurrent() {

    double lrv =
        double.tryParse(lrvController.text) ?? 0;

    double urv =
        double.tryParse(urvController.text) ?? 100;

    double pv =
        double.tryParse(processController.text) ?? 0;

    double span = urv - lrv;

    percentage =
        ((pv - lrv) / span) * 100;

    currentOutput =
        4 + ((pv - lrv) / span) * 16;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '4-20mA Calculator',
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),

          child: Column(
            children: [

              const Text(
                '4-20mA Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: lrvController,
                decoration: const InputDecoration(
                  labelText: 'LRV',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: urvController,
                decoration: const InputDecoration(
                  labelText: 'URV',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              const Divider(),

              const Text(
                'mA → Process Value',
              ),

              const SizedBox(height: 10),

              TextField(
                controller: currentController,
                decoration: const InputDecoration(
                  labelText: 'Current (mA)',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: currentToProcess,
                child: const Text(
                  'Calculate Process Value',
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'PV = ${processValue.toStringAsFixed(3)}',
              ),

              Text(
                '% = ${percentage.toStringAsFixed(1)}',
              ),

              const SizedBox(height: 20),

              const Divider(),

              const Text(
                'Process Value → mA',
              ),

              const SizedBox(height: 10),

              TextField(
                controller: processController,
                decoration: const InputDecoration(
                  labelText: 'Process Value',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: processToCurrent,
                child: const Text(
                  'Calculate Current',
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'mA = ${currentOutput.toStringAsFixed(3)}',
              ),

              Text(
                '% = ${percentage.toStringAsFixed(1)}',
              ),

            ],
          ),
        ),
      ),
    );
  }
}