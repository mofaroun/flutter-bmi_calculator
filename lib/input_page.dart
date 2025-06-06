import 'package:bmi_calc/calculatorBrain.dart';
import 'package:bmi_calc/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'genderSelection.dart';
import 'constants.dart';

enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum? selectedGender;
  int height = 60;
  int weight = 150;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: ktextSTyle,
          ),
        ),
        body: (Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                // Gender Selection Row
                children: [
                  Expanded(
                      // MaleCard
                      child: ResuableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderEnum.male;
                      });
                    },
                    colour: selectedGender == GenderEnum.male
                        ? kactiveColor
                        : kinactiveColor,
                    cardChild: GenderSelection(
                        gender: "MALE", genderIcon: FontAwesomeIcons.mars),
                  )),
                  Expanded(
                    // Female Card
                    child: ResuableWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderEnum.female;
                        });
                      },
                      colour: selectedGender == GenderEnum.female
                          ? kactiveColor
                          : kinactiveColor,
                      cardChild: GenderSelection(
                          gender: "FEMALE", genderIcon: FontAwesomeIcons.venus),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ResuableWidget(
              colour: kcontainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: ktextSTyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: knumStyle),
                      Text('in', style: ktextSTyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x55EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 36,
                      max: 100,
                      divisions: 64,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResuableWidget(
                    colour: kcontainerColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: ktextSTyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: knumStyle,
                              ),
                              Text(
                                "lbs",
                                style: ktextSTyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ]),
                  )),
                  Expanded(
                      child: ResuableWidget(
                    colour: kcontainerColor,
                    cardChild: (Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: ktextSTyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: knumStyle,
                              ),
                              Text(
                                " Years",
                                style: ktextSTyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ])),
                  ))
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATE",
              onTap: () {
                Calculatorbrain calc =
                    Calculatorbrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),                    
                  );
                }));
              },
            ),
          ],
        )));
  }
}

class BottomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonTitle;
  const BottomButton({
    super.key,
    this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
        color: kbottomContainerColor,
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
          style: kCalctextSTyle,
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPress;

  const RoundIconButton({super.key, this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 1,
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
