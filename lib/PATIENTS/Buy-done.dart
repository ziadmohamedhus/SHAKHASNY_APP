
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components.dart';
import 'Home-bage.dart';

class Buy_done extends StatelessWidget {
  late String name;
  late num money;
  late int number;
  Buy_done({required num m,required int num,required String n})
  {
    money=m;
    name=n;
    number=num;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text('Thank you,',style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(height: 5.0,),
                        Text('Buying succeeded',style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Icon(Icons.format_list_bulleted_outlined,size: 35.0,)
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Image.asset('asset/icon/10.png',height: 200,),
              SizedBox(height: 20,),
              Text('name : ${patient["first"]} ${patient["second"]}',style: TextStyle(color: HexColor('8a86e2'),fontSize: 25.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('phone :  ${patient["phone"]}',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text('Purchases : $name',style: TextStyle(color: HexColor('8a86e2'),fontSize: 25.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('number of product :  $number',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),


              SizedBox(height: 30,),
              Text('total bill:  $money',style: TextStyle(color: Colors.pink[200],fontSize:20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              Container(
                color: Colors.pink[200],
                child: MaterialButton(onPressed: ()
                {

                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Home_bage()));
                },child: Text('HOME',style: TextStyle(color: HexColor('8a86e2'),fontSize: 25,fontWeight: FontWeight.bold),),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}