import 'package:calculator/ResultPage.dart';
import 'package:calculator/calculator.dart';
import 'package:calculator/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_widget.dart';
import 'design.dart';

const Color kinactiveCardColor = Color(0XFF111328);
const Color kactiveCardColor = Color(0XFF1D1E33);

enum Gender { male, female }

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  int height = 120;
  int weight = 75;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CardWidget(
                  color: selectedGender == Gender.male
                      ? kactiveCardColor
                      : kinactiveCardColor,
                  cardContent: IconContent(
                    text: "Male",
                    icon: Icons.font_download,
                  ),
                  action: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                  child: CardWidget(
                // color: _isCardActive2 ? kactiveCardColor : kinactiveCardColor,
                color: selectedGender == Gender.female
                    ? kactiveCardColor
                    : kinactiveCardColor,
                cardContent:
                    IconContent(text: "Female", icon: FontAwesomeIcons.venus),
                action: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
              )),
            ],
          )),
          Expanded(
              child: CardWidget(
            color: kinactiveCardColor,
            cardContent: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(height.toString(),
                        style: kmainTextStyle.copyWith(fontSize: 50.0)),
                    Text(
                      " cm",
                      style: kmainTextStyle,
                    ),
                  ],
                ),
                Slider(
                    min: 120,
                    max: 220,
                    // inactiveColor: Colors.green, // Para cambiar el color
                    value: height.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    })
              ],
            ),
            action: () {},
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: CardWidget(
                color: kinactiveCardColor,
                cardContent: Column(
                  children: [
                    Text(
                      'WEIGHT',
                      style: kmainTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            })
                      ],
                    )
                  ],
                ),
                action: () {},
              )),
              Expanded(
                  child: CardWidget(
                color: kinactiveCardColor,
                cardContent: Column(
                  children: [
                    Text(
                      'Age',
                      style: kmainTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            })
                      ],
                    )
                  ],
                ),
                action: () {},
              )),
            ],
          )),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 40.0,
              color: Color(0XFFEB1555),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kMainButtonStyle,
                ),
              ),
            ),
            onTap: () {
              // Crearemos un objecto de Calculator
              Calculator calc = Calculator(weight, height);
              String result = calc.calculateBMI();
              String BMIcategory = calc.getBMICategory();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(height: height, weight: weight, result: result,BMIcategory: BMIcategory);
              }));
            },
          )
        ],
      ),
    );
  }
}
