import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'box_widget.dart';
import 'data.dart';
import 'icon_text_child.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _isMale = true;
  int _height = 180;
  int _weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMale = true;
                      });
                    },
                    child: BoxWidget(
                      color: _isMale ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconTextChild(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMale = false;
                      });
                    },
                    child: BoxWidget(
                      color: _isMale ? kInactiveCardColor : kActiveCardColor,
                      cardChild: IconTextChild(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxWidget(
                    color: Color(0xFF1D1D33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                          ),
                          child: Slider(
                            // activeColor: Colors.white,
                            value: _height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                _height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxWidget(
                    color: Color(0xFF1D1D33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BoxWidget(
                    color: Color(0xFF1D1D33),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
