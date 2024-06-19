
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:lottie/lottie.dart';

import '../components.dart';

class cancel_appointment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..getallappointments(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder:(context , state)=>Scaffold(
          body:ConditionalBuilder(
            condition: state is! RejectAppointmentsDoctorLoadingState,
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
            builder: (context){
              if(AppCubit.get(context).reject_appointments.length != 0)
                {
                  return ListView(
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
                                Text('Canceled',style: TextStyle(
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
                      for(int i=0;i<AppCubit.get(context).reject_appointments.length;i++)

                        Dismissible(
                          key: Key(AppCubit.get(context).reject_appointments[i].id.toString()),
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
                                  CircleAvatar(backgroundColor: HexColor('8a86e2'),radius: 35.0,child: Text('${AppCubit.get(context).reject_appointments[i].time}',style: TextStyle(color: Colors.white70,fontSize: 15.0,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),),
                                  SizedBox(width: 20.0,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('${AppCubit.get(context).reject_appointments[i].patient!.firstName} ${AppCubit.get(context).reject_appointments[i].patient!.lastName}' ,style: TextStyle(color:  HexColor('32313a'),fontSize: 20.0,fontWeight: FontWeight.w600,),),
                                        Text('${AppCubit.get(context).reject_appointments[i].date}' ,style: TextStyle(color: Colors.grey[800],fontSize: 15.0,fontWeight: FontWeight.w500,),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Lottie.network(
                                          'https://assets4.lottiefiles.com/packages/lf20_mLtaRR.json')),
                                ]),
                              ),
                            ),
                          ),
                          onDismissed: (direction)
                          {

                          },
                        )
                    ],
                  );
                }
              else
                {
                  return Center(child: Text("Donot have any appointment",style: TextStyle(color: Colors.grey,fontSize: 24),));

                }
            },
          ),
        ),
      )
    );
  }
}
