import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 174.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = "Select Data";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    height: size.height * 0.40,
                    color: const Color.fromRGBO(76, 175, 80, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BMI",
                          style: TextStyle(
                              fontSize: 50,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Calculator",
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: Text(
                              "$_bmi",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Condition :",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " $_condition",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white))
                              ]),
                        )
                      ],
                    )),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Choose Data",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.green)),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Height :",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${_height} cm",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black))
                            ]),
                      ),
                      Slider(
                        value: _height,
                        min: 0,
                        max: 250,
                        onChanged: (height) {
                          setState(() {
                            _height = height;
                          });
                        },
                        label: "$_height",
                        divisions: 250,
                        activeColor: Colors.black87,
                        inactiveColor: Colors.black12,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Weight :",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${_weight} kg",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black))
                            ]),
                      ),
                      Slider(
                          value: _weight,
                          min: 0,
                          max: 300,
                          onChanged: (weight) {
                            setState(() {
                              _weight = weight;
                            });
                          },
                          label: "$_weight",
                          divisions: 200,
                          inactiveColor: Colors.black12,
                          activeColor: Colors.black87),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      onPressed: () {
                        _bmi = (_weight / ((_height / 100) * (_height / 100)))
                            .round()
                            .toInt();
                        if (_bmi >= 10.5 && _bmi <= 25) {
                          _condition = "Normal";
                        } else if (_bmi > 25 && _bmi <= 35) {
                          _condition = "Over Weight";
                        } else if (_bmi > 35) {
                          _condition = "Obesity";
                        } else {
                          _condition = "UnderWeight";
                        }
                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
