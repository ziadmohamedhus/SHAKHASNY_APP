

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'BMI_result.dart';



class BMI extends StatefulWidget {

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool ismail=true;
  double hight=180.0;
  int age=18;
  int weight=60;
//تنفذ اول حاجة  قبل البلد
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('BMI',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)
          ,textAlign: TextAlign.center,)
          ,centerTitle: true,
          ),
        body:Column(
          children: [
            Expanded(child:
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(

                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ismail=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ismail?HexColor('8a86e2'):HexColor('ffe0f4'),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,size: 80.0,),
                            SizedBox(height: 10.0,),
                            Text('MALE',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w700),)
                          ],),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child:
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          ismail=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ismail?HexColor('ffe0f4'):HexColor('8a86e2'),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,size: 80.0,),
                            SizedBox(height: 10.0,),
                            Text('FEMALE',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w700),)
                          ],),
                      ),
                    ),
                  ),


                ],),
              ),
            )),


            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: HexColor('8a86e2')
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HIGHT',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('${hight.round()}',style: TextStyle(fontSize: 33.0,fontWeight: FontWeight.w700),),
                        Text('CM',style: TextStyle(fontSize:10.0,fontWeight: FontWeight.w700),)],),


                    Slider(
                        activeColor: HexColor('ffe0f4'),

                        //inactiveColor: Colors.white,
                        value: hight,
                        max: 250.0,
                        min: 50.0,
                        onChanged:(value){setState(() {
                          hight=value;
                        });}

                    ),


                  ],),
              ),
            ),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: HexColor('8a86e2')
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),),
                        Text('${age}',style: TextStyle(fontSize: 33.0,fontWeight: FontWeight.w700),),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){setState(() {
                                age--;
                              });},mini:true,child: Icon(Icons.remove,color: Colors.black,),backgroundColor: HexColor('ffe0f4') ,),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(onPressed: (){setState(() {
                                age++;
                              });},mini:true,child: Icon(Icons.add,color: Colors.black,),backgroundColor: HexColor('ffe0f4') ,),]
                        ),
                      ],),
                  ),
                ),
                SizedBox(width: 20.0,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: HexColor('8a86e2')
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${weight}',style: TextStyle(fontSize: 33.0,fontWeight: FontWeight.w700),),
                              Text('KG',style: TextStyle(fontSize:10.0,fontWeight: FontWeight.w700),),]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){setState(() {
                                weight--;
                              });},mini:true,child: Icon(Icons.remove,color: Colors.black,),backgroundColor: HexColor('ffe0f4') ,),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(onPressed: (){setState(() {
                                weight++;
                              });},mini:true,child: Icon(Icons.add,color: Colors.black,),backgroundColor: HexColor('ffe0f4') ,),]
                        ),

                      ],),
                  ),
                ),

              ],),
            )),
            Container(
                width: double.infinity,
                height: 60.0,
                color:  HexColor('ffe0f4'),
                child:
                MaterialButton(
                    onPressed: (){
                      double result=weight/pow(hight/100, 2);
                      print(result.round());
                      //التنقل بين صفح
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(result: result.round(),age: age,gender: ismail,)),);
                    },
                    child: Text('CACULATE',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)))
          ],
        )

    );
  }
}






