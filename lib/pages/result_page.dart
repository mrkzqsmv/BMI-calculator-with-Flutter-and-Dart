import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double weight;
  final double height;
  const ResultPage({super.key, required this.weight, required this.height});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var userBMI;

  @override
  void initState() {
    super.initState();
    userBMI = (widget.weight / (widget.height * widget.height));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Results'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade700,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${userBMI.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              _bmiBul(),
            ],
          ),
        ),
      ),
    );
  }

  _bmiBul() {
    if (userBMI <= 18.5) {
      return const Text(
        'Underweight',
        textAlign: TextAlign.center,
      );
    } else if (18.5 < userBMI && userBMI < 24.9) {
      return const Text('Normal weight', textAlign: TextAlign.center);
    } else if (25.0 < userBMI && userBMI < 29.9) {
      return const Text('Overweight (mildly overweight)',
          textAlign: TextAlign.center);
    } else if (30.0 < userBMI && userBMI < 34.9) {
      return const Text('Obesity Class 1 (moderate obesity)',
          textAlign: TextAlign.center);
    } else if (35.0 < userBMI && userBMI < 39.9) {
      return const Text('Obesity Class 2 (severe obesity)',
          textAlign: TextAlign.center);
    } else if (userBMI > 40.0) {
      return const Text('Obesity Class 3 (morbid obesity)',
          textAlign: TextAlign.center);
    }
  }
}
