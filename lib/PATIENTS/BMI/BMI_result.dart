
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Result extends StatelessWidget {
//'GENDER:${gender?'MALE':'FEMALE'}
  bool gender;
  int age;
  int result;
  Result({this.result=0,this.age=0,this.gender=true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('USERS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),textAlign: TextAlign.center,),centerTitle: true,),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: HexColor('ffe0f4'),
                  borderRadius: BorderRadius.circular(15),
                ),

                child:Text('User Gender is : ${gender?'MALE':'FEMALE'}',style: TextStyle(fontSize: 19,color:HexColor('32313a'),fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: HexColor('ffe0f4'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:Text('BMI Result is : $result',style: TextStyle(fontSize: 19,color:HexColor('32313a'),fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: HexColor('ffe0f4'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:Text('User age is : $age years',style: TextStyle(fontSize: 19,color:HexColor('32313a'),fontWeight: FontWeight.bold),)),

          ],
        ),
      ),
    );
  }
}
