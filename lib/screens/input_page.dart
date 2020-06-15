import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import 'package:bmicalculator/components/icon_content.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:bmicalculator/calculator_brain.dart';
import 'results_page.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 170;
  int weight = 50;
  int age = 21;
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        label: 'Male',
                        colour: selectedGender == Gender.Male
                            ? kActiveCardElementColor
                            : kInActiveCardElementColor,
                      ),
                      colour: selectedGender == Gender.Male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        label: 'Female',
                        colour: selectedGender == Gender.Female
                            ? kActiveCardElementColor
                            : kInActiveCardElementColor,
                      ),
                      colour: selectedGender == Gender.Female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: kEnabledThumbRadius,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: kOverlayRadius,
                        ),
                        thumbColor: kBottomContainerColor,
                        activeTrackColor: kActiveTrackColor,
                        inactiveTrackColor: kInactiveTrackColor,
                        overlayColor: kOverlayColor,
                      ),
                      child: Slider(
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        value: height.toDouble(),
                        min: kMinSlider,
                        max: kMaxSlider,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onTap: () {
                                  setState(() {
                                    if (weight > 20) weight--;
                                  });
                                },
                                onLongPress: () {
                                  _timer = Timer.periodic(
                                    Duration(milliseconds: 100),
                                    (Timer timer) => setState(
                                      () {
                                        if (weight > 20)
                                          weight--;
                                        else
                                          timer.cancel();
                                      },
                                    ),
                                  );
                                },
                                onLongPressUp: () {
                                  _timer.cancel();
                                },
                                backgroundColor: kFloatingBackgroundColor,
                                icon: FontAwesomeIcons.minus,
                                iconSize: kRoundIconSize,
                              ),
                              SizedBox(
                                width: kGap,
                              ),
                              RoundIconButton(
                                iconSize: kRoundIconSize,
                                onTap: () {
                                  setState(() {
                                    if (weight < 100) weight++;
                                  });
                                },
                                onLongPress: () {
                                  _timer = Timer.periodic(
                                    Duration(milliseconds: 100),
                                    (Timer timer) => setState(
                                      () {
                                        if (weight < 100)
                                          weight++;
                                        else
                                          timer.cancel();
                                      },
                                    ),
                                  );
                                },
                                onLongPressUp: () {
                                  _timer.cancel();
                                },
                                backgroundColor: kFloatingBackgroundColor,
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                iconSize: kRoundIconSize,
                                onTap: () {
                                  setState(() {
                                    if (age > 5) age--;
                                  });
                                },
                                onLongPress: () {
                                  _timer = Timer.periodic(
                                    Duration(milliseconds: 100),
                                    (Timer timer) => setState(
                                      () {
                                        if (age > 5)
                                          age--;
                                        else
                                          timer.cancel();
                                      },
                                    ),
                                  );
                                },
                                onLongPressUp: () {
                                  _timer.cancel();
                                },
                                backgroundColor: kFloatingBackgroundColor,
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: kGap,
                              ),
                              RoundIconButton(
                                iconSize: kRoundIconSize,
                                onTap: () {
                                  setState(() {
                                    if (age < 100) age++;
                                  });
                                },
                                onLongPress: () {
                                  _timer = Timer.periodic(
                                    Duration(milliseconds: 100),
                                    (Timer timer) => setState(
                                      () {
                                        if (age < 100)
                                          age++;
                                        else
                                          timer.cancel();
                                      },
                                    ),
                                  );
                                },
                                onLongPressUp: () {
                                  _timer.cancel();
                                },
                                backgroundColor: kFloatingBackgroundColor,
                                icon: FontAwesomeIcons.plus,
                              ),
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
                CalculatorBrain brain =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: brain.calculateBMI(),
                      resultText: brain.getResult(),
                      interpretation: brain.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
