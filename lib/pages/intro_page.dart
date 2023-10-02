import 'package:bmi_calculator/components/get_started_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Image.asset(
                'assets/images/weight_tracker.png',
                width: double.infinity,
              ),
            ),
            const Spacer(),
            Text(
              'Welcome to the \nBMI Calculator',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            const GetStartedButton(),
          ],
        ),
      ),
    );
  }
}
