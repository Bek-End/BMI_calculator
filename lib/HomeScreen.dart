import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

Gender selectedGender;

const kInactiveColor = Color(0xFF2b3131);
const kActiveColor = Color(0xFFd50100);

Color femaleCont = kInactiveColor;
Color maleCOnt = kInactiveColor;

const kLabelText = TextStyle(fontSize: 18.0);

int height = 170;
int w = 60, a = 19;

const kNumberText = TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate your BMI"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableContainer(
                      otp: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      customChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 75,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Male",
                            style: kLabelText,
                          ),
                        ],
                      ),
                      contColor: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                        otp: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 75,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Female",
                              style: kLabelText,
                            ),
                          ],
                        ),
                        contColor: selectedGender == Gender.female
                            ? kActiveColor
                            : kInactiveColor),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableContainer(
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("SELECT HEIGHT", style: kLabelText),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(height.toString(), style: kNumberText),
                                Text("CM", style: kLabelText),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 16.0),
                                  thumbColor: kInactiveColor,
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 32.0),
                                  activeTrackColor: Colors.yellow,
                                  inactiveTrackColor: Colors.green),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120,
                                max: 220,
                                onChanged: (double changeHeight) {
                                  setState(() {
                                    height = changeHeight.round();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        contColor: kActiveColor),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableContainer(
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "AGE",
                              style: kLabelText,
                            ),
                            Text(a.toString(), style: kNumberText),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Increment(
                                    fontSunnat: FontAwesomeIcons.minus,
                                    func: () {
                                      setState(() {
                                        a--;
                                        if (a <= 0) {
                                          a = 0;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Increment(
                                    fontSunnat: FontAwesomeIcons.plus,
                                    func: () {
                                      setState(() {
                                        a++;
                                        if (a <= 0) {
                                          a = 0;
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        contColor: kActiveColor),
                  ),
                  Expanded(
                    child: ReusableContainer(
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "WEIGHT",
                              style: kLabelText,
                            ),
                            Text(w.toString(), style: kNumberText),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Increment(
                                    fontSunnat: FontAwesomeIcons.minus,
                                    func: () {
                                      setState(() {
                                        w--;
                                        if (w <= 20) {
                                          w = 20;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Increment(
                                    fontSunnat: FontAwesomeIcons.plus,
                                    func: () {
                                      setState(() {
                                        w++;
                                        if (w >= 200) {
                                          w = 200;
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        contColor: Color(0xFFd50100)),
                  )
                ],
              ),
            ),
            OpenWindow(
              tap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondPage(
                            selectedGender: selectedGender,
                            height: height,
                            weight: w,
                            age: a,
                          )));
                });
              },
              textOperate: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "CALCULATE RESULT",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OpenWindow extends StatelessWidget {
  const OpenWindow({@required Function this.tap, this.textOperate});
  final Function tap;
  final Widget textOperate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: 75.0,
        width: double.infinity,
        color: Color(0xFFd50100),
        margin: EdgeInsets.only(top: 18.0),
        child: textOperate,
      ),
    );
  }
}

class Increment extends StatelessWidget {
  Increment({@required this.fontSunnat, this.func});
  final IconData fontSunnat;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: 50.0,
        height: 50.0,
        child: Icon(
          fontSunnat,
          size: 40.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: kInactiveColor,
        ),
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  ReusableContainer({@required this.contColor, this.customChild, this.otp});
  final Color contColor;
  final Widget customChild;
  final Function otp;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otp,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: customChild,
        decoration: BoxDecoration(
          color: contColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF111212).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({this.selectedGender, this.height, this.age, this.weight});
  final Gender selectedGender;
  final int height;
  final int age, weight;
  String condition;
  double bmi;
  @override
  Widget build(BuildContext context) {
    bmi = weight / (height * 0.01 * height * 0.01);
    if (bmi <= 18.0) {
      condition = "Low BMI";
    } else if (18.5 <= bmi && bmi <= 24.9) {
      condition = "Normal BMI";
    } else if (25.0 <= bmi && bmi <= 29.9) {
      condition = "Above normal BMI";
    } else if (30.0 <= bmi && bmi <= 34.9) {
      condition = "High BMI";
    } else if (35.0 <= bmi && bmi <= 39.9) {
      condition = "High BMI";
    } else if (40.0 <= bmi) {
      condition = "Too high BMI";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFF2b3131),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF111212).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Text(
                "For a " +
                    age.toString() +
                    " y.o " +
                    ((selectedGender == Gender.male ? "male " : "female") +
                        " you have a " +
                        condition +
                        ": " +
                        bmi.round().toString()),
                style: TextStyle(fontSize: 30.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
