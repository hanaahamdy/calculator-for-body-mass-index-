import 'package:bmi_calculator/modules/bmi_result.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
double height = 80.0;
  bool is_male =true;
  int age=20;
  int weight=40;
  var bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(onTap: (){setState(() {
                            is_male=true;
                          });},
                            child: Container(
                        decoration: BoxDecoration(
                              color: is_male?Colors.pink:Color(0xff424242),
                              borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male_outlined,
                                color: Colors.white,
                                size: 39,
                              ),
                              Text("Male", style: styleOne)
                            ],
                        ),
                      ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: GestureDetector(onTap: (){setState(() {
                            is_male=false;
                          });},
                            child: Container(
                        decoration: BoxDecoration(
                              color:is_male? color_light_black:Colors.pink,
                              borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female_outlined,
                                color: Colors.white,
                                size: 39,
                              ),
                              Text(
                                "Female",
                                style: styleOne,
                              )
                            ],
                        ),
                      ),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: color_light_black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: styleOne,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("${height.round()}", style: styleOne),
                            Text(
                              "cm",
                              style: styleTwo,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Slider(
                            divisions: 100,
                            min: 80,
                            max: 200,
                            activeColor: Colors.pink,
                            inactiveColor: Colors.grey,
                            value:height ,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            })
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff424242),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: styleOne,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "$age",
                            style: styleOne,
                          ),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(

                                onPressed: () {setState(() {

                                  age++;
                                });},mini: true,backgroundColor:color_light_black.withOpacity(.9) ,elevation: 12,
                                child: Icon(Icons.add),
                             heroTag: 'float1', ),
                              FloatingActionButton(mini: true,backgroundColor:color_light_black.withOpacity(.9) ,elevation: 12,
                                onPressed: () {setState(() {
                                  age--;
                                });},
                                child: Icon(Icons.minimize),heroTag: 'float2',
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),

                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff424242),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Weight",
                                style: styleOne,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "$weight",
                                style: styleOne,
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {setState(() {
                                      weight++;
                                    });},mini: true,backgroundColor:color_light_black.withOpacity(.9) ,elevation: 12,
                                    child: Icon(Icons.add),
                                 heroTag: "Tag3", ),
                                  FloatingActionButton(mini: true,backgroundColor:color_light_black.withOpacity(.9) ,elevation: 12,
                                    onPressed: () {setState(() {
                                      weight--;
                                    });},
                                    child: Icon(Icons.minimize),
                                 heroTag: "Tag4", )
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              )),
              Container(
                  width: double.infinity,
                  child: MaterialButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){return BmiResult(result:bmiCalculate() ,status: getResult(),advise: getInterpretation(),);}));},
                    child: Text(
                      "Calculate",
                      style: styleOne,
                    ),
                    color: Colors.pink,
                  ))
            ],
          ),
        ));
  }
 String bmiCalculate(){
    bmi=weight/pow(height/100,2);
    return bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(bmi>=25){return "overweight";}
    else if(bmi>18.5){return "normal";}
    else
      return "underWeight";

  }
String getInterpretation()
{
  if(bmi>=25){return "you have a higher than normal weight. try to exercise more";}
  else if(bmi>18.5){return "you have normal body weight. good job";}
  else
    return "you have lower than normal body weight. you can eat a bit more";

}
}
