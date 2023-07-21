import 'package:bmi_calculator_project/calculator_brain.dart';
import "package:bmi_calculator_project/components/bottom_button.dart";
import "package:bmi_calculator_project/components/icon_widget.dart";
import "package:bmi_calculator_project/components/reusable_card.dart";
import "package:bmi_calculator_project/components/round_icon_button.dart";
import "package:bmi_calculator_project/constants.dart";
import "package:bmi_calculator_project/screens/results_page.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

enum Genders { female, male }

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 20;

  void selectGender(Genders gender) {
    (gender == selectedGender)
        ? selectedGender = null
        : selectedGender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     colorScheme:
      //         ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: Icon(
      //       Icons.add,
      //       color: Color(0XFFFFFFFF),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == Genders.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconWidget(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                      handleAction: () {
                        setState(() {
                          selectGender(Genders.male);
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == Genders.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconWidget(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                      handleAction: () {
                        setState(() {
                          selectGender(Genders.female);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: kLabelStyleText),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("$height", style: kBoldLabelStyleText),
                        Text('cm', style: kLabelStyleText)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: kInactiveSliderColor,
                          thumbColor: kThumbSliderColor,
                          overlayColor: kOverlaySliderColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 2.0),
                      child: Slider(
                          min: 120.0,
                          max: 320.0,
                          value: height.toDouble(),
                          onChanged: (double currentValue) {
                            setState(() {
                              height = currentValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: kLabelStyleText),
                          Text(
                            "$weight",
                            style: kBoldLabelStyleText,
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                handleAction: () {
                                  setState(() {
                                    weight -= 1;
                                    if (weight < 0) {
                                      weight = 0;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                handleAction: () {
                                  setState(() {
                                    weight += 1;
                                    if (weight > 300) {
                                      weight = 300;
                                    }
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelStyleText,
                          ),
                          Text(
                            "$age",
                            style: kBoldLabelStyleText,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                handleAction: () {
                                  setState(() {
                                    age -= 1;
                                    if (age < 5) {
                                      age = 5;
                                    }
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                handleAction: () {
                                  setState(() {
                                    age += 1;
                                    if (age > 99) {
                                      age = 99;
                                    }
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calcBrain =
                    CalculatorBrain(weight: weight, height: height);
                // Navigator.pushNamed(context, "/results");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calcBrain
                          .calculateBMI(), //it will execute the value once the widget executes and needs to access that value
                      resultText: calcBrain.getResult(),
                      interpretation: calcBrain.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
