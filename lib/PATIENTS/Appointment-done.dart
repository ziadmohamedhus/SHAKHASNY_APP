
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Home-bage.dart';

class Appointment_done extends StatelessWidget {
  var scaffold_key=GlobalKey<ScaffoldState>();
  bool bottomsheat_active=false;
  String name;
  String phone;
  String date;
  String time;
  String country;
  String doctor;
  Appointment_done({required this.name  , required this.phone , required this.date , required this.time , required this.doctor , required this.country}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold_key,
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Text('FILLED OUT,',style: TextStyle(
                            color: HexColor('32313a'),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0,),
                        Text('Patient Form',style: TextStyle(
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
              Image.asset('asset/icon/9.png',height: 200,),
              SizedBox(height: 20,),
              Text('Thank you, $name',style: TextStyle(color: HexColor('8a86e2'),fontSize: 30.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('We will call you on:  $phone',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text('Your Doctor is :  $doctor',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text('Doctor\'s visit date:  $date',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text('Doctor\'s visit time:  $time',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text('Your Country is :  $country',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text('Bill:  500',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),

              MaterialButton(onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Home_bage()));
              },child: Text('HOME',style: TextStyle(color: HexColor('8a86e2'),fontSize: 25,fontWeight: FontWeight.bold),),),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if(bottomsheat_active)
            {
              Navigator.pop(context);
              bottomsheat_active=false;
            }
          else
          {
            bottomsheat_active=true;
            scaffold_key.currentState!.showBottomSheet((context) =>
                Container(

                  color: HexColor('ffe0f4'),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('YOUR TICKET',style: TextStyle(
                 color: HexColor('32313a'),
                fontSize: 25.0,
                 fontWeight: FontWeight.bold)),
                        SizedBox(height: 15,),
                        BarcodeWidget(data: name, barcode: Barcode.qrCode(),color: Colors.deepPurple,height: 220,),
                        SizedBox(height: 20,),

                      ],),
                  ),
                ),
              elevation: 25,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
              )
            );

          }

        },

        child: Icon(Icons.bookmarks),
      ),
    );
  }
}