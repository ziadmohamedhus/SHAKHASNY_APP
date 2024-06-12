
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Chat-with-doctor.dart';
import 'Take-apointment.dart';

class View_doctor extends StatelessWidget {

Map map={};
View_doctor(Map m)
{
  map=m;
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            //الشريط الاعلي
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Doctor profile,',style: TextStyle(
                 color: HexColor('32313a'),
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(Icons.format_list_bulleted_outlined,size: 35.0,)
                ],
              ),
            ),
            SizedBox(height: 35,),
            Hero(
              tag: 'name',
              child: CircleAvatar(
                backgroundColor: Colors.grey[400],
                backgroundImage: AssetImage('asset/image/${map["image"]}',),
                radius: 75.0,
              ),
            ),
            SizedBox(height: 20,),
            Text('Doctor Name : ${map['first']} ${map['second']}  ',style: TextStyle(
                 color: HexColor('32313a'),
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('Email : ${map['email']}',style: TextStyle(
                 color: HexColor('32313a'),
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('Phone : ${map['phone']}',style: TextStyle(
                 color: HexColor('32313a'),
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('Specification : ${map['specification']}',style: TextStyle(
                 color: HexColor('32313a'),
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('Experience : ${map['experience']} Years',style: TextStyle(
                 color: HexColor('32313a'),
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('The Salary :\$500',style: TextStyle(
                 color: HexColor('32313a'),
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold)),
            SizedBox(height: 30,),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Take_apointment(map)));
                },child: Text('TAKE APPOINTMENT',style: TextStyle(color: HexColor('8a86e2'),fontSize: 25,fontWeight: FontWeight.bold),),),
                Container(
                  height: 50.0,
                  color: HexColor('8a86e2'),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Chat_with_doctor(Doctor: map,)));
                    },
                    minWidth: 1.0,
                    child: Icon(
                      Icons.chat_outlined,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
