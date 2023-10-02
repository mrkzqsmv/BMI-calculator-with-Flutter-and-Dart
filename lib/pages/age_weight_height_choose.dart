import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

class ChooseAgeWeightHeight extends StatefulWidget {
  const ChooseAgeWeightHeight({super.key});

  @override
  State<ChooseAgeWeightHeight> createState() => _ChooseAgeWeightHeightState();
}

class _ChooseAgeWeightHeightState extends State<ChooseAgeWeightHeight> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final heightController = TextEditingController();
    final weightController = TextEditingController();
    final ageController = TextEditingController();
    double height = 0.0;
    double weight = 0.0;
    String age = '0';
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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How tall are you ?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              heightTextFormField(heightController, height),
              const SizedBox(
                height: 12,
              ),
              Text(
                'What\'s your weight ?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              weightTextFormField(weightController, weight),
              const SizedBox(
                height: 12,
              ),
              Text(
                'What\'s your age ?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              ageTextFormField(ageController, age),
              const Spacer(),
              seeResultButton(formKey, heightController, weightController,
                  ageController, context),
            ],
          ),
        ),
      ),
    );
  }

//create see result button
  InkWell seeResultButton(
      GlobalKey<FormState> formKey,
      TextEditingController heightController,
      TextEditingController weightController,
      TextEditingController ageController,
      BuildContext context) {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ResultPage(
                    height: double.parse(heightController.text),
                    weight: double.parse(weightController.text),
                  )));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue.shade900, Colors.blue.shade100],
            )),
        child: Center(
            child: Text(
          'See Results',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        )),
      ),
    );
  }

//create height TextFormField
  TextFormField heightTextFormField(
      TextEditingController heightController, double height) {
    return TextFormField(
      controller: heightController,
      validator: (value) {
        // Girdiyi doğrulama işlemi
        if (value!.isEmpty) {
          return "Please enter your height";
        }
        try {
          height = double.parse(value);
        } catch (e) {
          return "Enter a valid number";
        }
        return null; // Doğrulama başarılı
      },
      onChanged: (height) {
        height = height;
      },
      onSaved: (height) {
        height = height!;
      },
      keyboardType: TextInputType.number,
      decoration:
          const InputDecoration(hintText: '1.83', border: OutlineInputBorder()),
    );
  }

//create weight TextFormField
  TextFormField weightTextFormField(
      TextEditingController weightController, double weight) {
    return TextFormField(
      controller: weightController,
      keyboardType: TextInputType.number,
      validator: (value) {
        // Girdiyi doğrulama işlemi
        if (value!.isEmpty) {
          return "Please enter your weight";
        }
        try {
          weight = double.parse(value);
        } catch (e) {
          return "Enter a valid number";
        }
        return null; // Doğrulama başarılı
      },
      onChanged: (weight) {
        weight = weight;
      },
      onSaved: (weight) {
        weight = weight!;
      },
      decoration:
          const InputDecoration(hintText: '70.3', border: OutlineInputBorder()),
    );
  }

//create age TextFormField
  TextFormField ageTextFormField(
      TextEditingController ageController, String age) {
    return TextFormField(
      controller: ageController,
      keyboardType: TextInputType.number,
      validator: (value) {
        // Girdiyi doğrulama işlemi
        if (value!.isEmpty) {
          return "Please enter your age";
        }
        try {
          age = value;
        } catch (e) {
          return "Enter a valid number";
        }
        return null; // Doğrulama başarılı
      },
      onChanged: (value) {
        age = value;
      },
      onSaved: (deger) {
        age = deger!;
      },
      decoration:
          const InputDecoration(hintText: '20', border: OutlineInputBorder()),
    );
  }
}
