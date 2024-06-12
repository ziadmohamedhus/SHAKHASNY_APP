
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/MANAGER/view_patient.dart';
import 'package:hospital/components.dart';
class all_patient extends StatelessWidget {


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
                        Text('Patient',style: TextStyle(
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
              for(int i=0;i<Appointement_list.length;i++)
                Card(
                  color:  HexColor('8a86e2'),
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  shadowColor: Colors.black,
                  elevation: 30.0,
                  child: ListTile(
                    title:  Text('${Appointement_list[i]['name']} ',style: TextStyle(color:  HexColor('32313a'),fontSize: 20.0,fontWeight: FontWeight.w600,),) ,
                    subtitle: Text('${Appointement_list[i]['phone']} ',style: TextStyle(color: Colors.grey[800],fontSize: 15.0,fontWeight: FontWeight.w500,),),
                    //الصورة في الاول
                    leading: CircleAvatar(
                      backgroundColor:HexColor('ffe0f4'),
                    child: Text("${Appointement_list[i]['time']}" ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      radius: 35,
                    ),
                    //ايقونة في الاخر
                    trailing: Icon(Icons.more_horiz_outlined),
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>View_patient_Manager(Appointement_list[i]))) ;
                    },
                  ),
                ),
            ],
          ),
        )
    );
  }
}
