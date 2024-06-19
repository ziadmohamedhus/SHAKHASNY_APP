
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../components.dart';
import '../constant.dart';



class Top_Patient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase_Appo(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context ,state){},
        builder: (context ,state)=>Scaffold(
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
                            SizedBox(height: 5.0,),
                            Text('All Patients',style: TextStyle(
                                color: HexColor('32313a'),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          backgroundImage: patient_model!.data!.image !=
                              null
                              ? NetworkImage(
                              "${imagebase}${patient_model!.data!.image?.path}")
                              : NetworkImage(
                              "https://cdn-icons-png.freepik.com/512/8459/8459373.png"),
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
                        title:  Text('${Appointement_list[i]['name']}',style: TextStyle(color:  HexColor('32313a'),fontSize: 20.0,fontWeight: FontWeight.w600,),) ,
                        subtitle: Text('${Appointement_list[i]['phone']}',style: TextStyle(color: Colors.grey[800],fontSize: 15.0,fontWeight: FontWeight.w500,),),
                        //الصورة في الاول
                        leading: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[400],
                              child: Text("${Appointement_list[i]['time']}" , style: TextStyle(fontSize: 10 ,fontWeight: FontWeight.bold),),
                              radius: 25.0,
                            ),

                          ],
                        ),
                        //ايقونة في الاخر
                        trailing: Icon(Icons.more_horiz_outlined),

                      ),
                    ),
                ],
              ),

            )
        ),
      ),
    );
  }
}
