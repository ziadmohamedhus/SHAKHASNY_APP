
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:lottie/lottie.dart';

import '../components.dart';

class done_appointment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context , state)=>Scaffold(
          body:ListView(
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
                        Text('Appointments,',style: TextStyle(
                            color: HexColor('32313a'),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0,),
                        Text('Done',style: TextStyle(
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
              for(int i=0;i<done_Appointement_list.length;i++)
                if (done_Appointement_list[i]["doctor"]==Doc['id'].toString())
                Dismissible(
                  key: Key(done_Appointement_list[i]['name'].toString()),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color:  HexColor('ffe0f4'),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children:
                        [
                          CircleAvatar(backgroundColor: HexColor('8a86e2'),radius: 35.0,child: Text('${done_Appointement_list[i]['time']}',style: TextStyle(color: Colors.white70,fontSize: 15.0,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),),
                          SizedBox(width: 20.0,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${done_Appointement_list[i]['name']}' ,style: TextStyle(color:  HexColor('32313a'),fontSize: 20.0,fontWeight: FontWeight.w600,),),
                                Text('${done_Appointement_list[i]['date']}' ,style: TextStyle(color: Colors.grey[800],fontSize: 15.0,fontWeight: FontWeight.w500,),),
                              ],
                            ),
                          ),
                          Container(
                              width: 80.0,
                              height: 80.0,
                              child: Lottie.network(
                                  'https://assets5.lottiefiles.com/datafiles/s2s8nJzgDOVLOcz/data.json')),
                        ]),
                      ),
                    ),
                  ),
                  onDismissed: (direction)
                  {

                  },
                )
            ],
          ),
        ),
      )
    );
  }
}
