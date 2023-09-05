import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/gender_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  BmiBrain bmiBrain = BmiBrain();

  @override
  Widget build(BuildContext context) {
    double height = bmiBrain.getHeight();

    void onPressed() {
      double bmi = bmiBrain.calculateBmi();
      String result = bmiBrain.getResult(bmi);
      String interpretation = bmiBrain.getInterpretation(bmi);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Result(
            bmi: bmi,
            result: result,
            interpretation: interpretation,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  GenderButton(
                    onPressed: () => {
                      setState(
                        () => {bmiBrain.setGender(Gender.male)},
                      ),
                    },
                    icon: Icons.male,
                    text: 'Male',
                    selected: bmiBrain.isGenderSelected(Gender.male),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GenderButton(
                    onPressed: () => {
                      setState(
                        () => {bmiBrain.setGender(Gender.female)},
                      ),
                    },
                    icon: Icons.female,
                    text: 'Female',
                    selected: bmiBrain.isGenderSelected(Gender.female),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height (cm)',
                      style: labelTextStyle,
                    ),
                    Text(
                      bmiBrain.getHeight().toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 56,
                        color: Theme.of(context).textTheme.headlineMedium.color,
                      ),
                    ),
                    Slider(
                      value: height,
                      min: 1,
                      max: 250,
                      onChanged: (value) => {
                        setState(
                          () => {bmiBrain.setHeight(value)},
                        )
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight (kg)',
                            style: labelTextStyle,
                          ),
                          Text(
                            bmiBrain.getWeight().toString(),
                            style: valueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () => {
                                  setState(() => {
                                        bmiBrain.decreaseWeight(),
                                      })
                                },
                                child: Icon(Icons.remove),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    CircleBorder(),
                                  ),
                                  iconColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColorDark,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .buttonTheme
                                        .colorScheme
                                        .primary,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => {
                                  setState(() => {
                                        bmiBrain.increaseWeight(),
                                      })
                                },
                                child: Icon(Icons.add),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    CircleBorder(),
                                  ),
                                  iconColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColorDark,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .buttonTheme
                                        .colorScheme
                                        .primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: labelTextStyle,
                          ),
                          Text(
                            bmiBrain.getAge().toString(),
                            style: valueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () => {
                                  setState(() => {
                                        bmiBrain.decreaseAge(),
                                      })
                                },
                                child: Icon(Icons.remove),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    CircleBorder(),
                                  ),
                                  iconColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColorDark,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .buttonTheme
                                        .colorScheme
                                        .primary,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => {
                                  setState(() => {
                                        bmiBrain.increaseAge(),
                                      })
                                },
                                child: Icon(Icons.add),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    CircleBorder(),
                                  ),
                                  iconColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColorDark,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .buttonTheme
                                        .colorScheme
                                        .primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 32, color: Theme.of(context).primaryColorDark),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
