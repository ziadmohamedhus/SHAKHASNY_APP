import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class AboutAs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage('asset/icon/logo2.png'),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all( 20),
              child:   Center(child: Text("SHAKHSNI APP is a digital healthcare platform that connects patients with healthcare and health services .through the platform patients can search for doctors by specialty ",style: TextStyle(color: HexColor('32313a')
                  ,fontSize: 20,fontWeight: FontWeight.bold
              ),),
              ),
            ) ,
            //SizedBox(height: 10,),


            SizedBox(height: 30,),
            Image(width:350,height: 300,image: AssetImage('asset/icon/doc3.jpg')),
           // SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [

                  Expanded(child: Image(width:200,height: 150,image: AssetImage('asset/icon/doc1.jpg'))),
                 SizedBox(width: 10.0,),
                Expanded(child: Image(width:200,height: 150,image: AssetImage('asset/icon/doc2.jpg'))),


              ],
            )

          ],
        ),
      ),
    );
  }
}