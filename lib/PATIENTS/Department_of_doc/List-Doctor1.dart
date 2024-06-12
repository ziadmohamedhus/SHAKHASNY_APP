
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/components.dart';

import '../View-doctor.dart';


class Dentist extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15.0),

            child: ListView(
              children: [
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Department of,',style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                          SizedBox(height: 5.0,),
                          Text('Dentist',style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        backgroundImage: AssetImage('asset/image/1.jpg'),
                        radius: 25.0,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                for(int i=0;i<doctorlist_Dentist.length;i++)
                  Card(
                    color:  HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    elevation: 30.0,
                    child: ListTile(
                      title:  Text('DR: ${doctorlist_Dentist[i]['first']}  ${doctorlist_Dentist[i]['second']}',style: TextStyle(color:  HexColor('32313a'),fontSize: 20.0,fontWeight: FontWeight.w600,),) ,
                      subtitle: Text('${doctorlist_Dentist[i]['experience']} Years Experience ',style: TextStyle(color: Colors.grey[800],fontSize: 15.0,fontWeight: FontWeight.w500,),),
                      //الصورة في الاول
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        backgroundImage: AssetImage('asset/image/${doctorlist_Dentist[i]['image']}'),
                        radius: 25.0,
                      ),
                      //ايقونة في الاخر
                      trailing: Icon(Icons.more_horiz_outlined),
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> View_doctor(doctorlist_Dentist[i])));},
                    ),
                  ),
              ],
            ),

        )
    );
  }
}
