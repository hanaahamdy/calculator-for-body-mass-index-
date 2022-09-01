import 'package:bmi_calculator/modules/bmi_valculator.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final result;
  final status;
  final advise;

  const BmiResult(
      {super.key,
      required this.result,
      required this.status,
      required this.advise});

  @override
  Widget build(BuildContext context) {
    var Home_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "You Result ",
                style: resultTitleStyle,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "$status",
                      style: resultTextStyle,
                    ),
                    Text(
                      "${result}",
                      style: resultWeight,
                    ),
                    Text(
                      " $advise",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                height: Home_height * .3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: color_light_black),
              ),
            ),
            SizedBox(
              height: Home_height * .07,
            ),
            Container(
                width: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BmiCalculator()),
                        (route) => false);
                  },
                  child: Text(
                    "Re-Calculate",
                    style: styleOne,
                  ),
                  color: Colors.pink,
                ))
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bmi Calculator",
          style: styleTwo,
        ),
      ),
    );
  }
}
