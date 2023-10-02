import 'package:bmi_calculator/components/next_button.dart';
import 'package:flutter/material.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({super.key});

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  bool isMaleChoosen = false;
  bool isFemaleChoosen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'What\'s Your Gender ?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isMaleChoosen
                        ? Colors.green
                        : Colors.black.withOpacity(0.2),
                  ),
                  child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isMaleChoosen = !isMaleChoosen;
                          if (isMaleChoosen == true) {
                            isFemaleChoosen = false;
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.female,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Female',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isFemaleChoosen
                        ? Colors.green
                        : Colors.black.withOpacity(0.2),
                  ),
                  child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isFemaleChoosen = !isFemaleChoosen;
                          if (isFemaleChoosen == true) {
                            isMaleChoosen = false;
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.male,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Male',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
            const NextButton(),
          ],
        ),
      ),
    );
  }
}
