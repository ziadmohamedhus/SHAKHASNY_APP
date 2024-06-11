

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:lottie/lottie.dart';

import '../DATABASE/cubit.dart';
import '../MANAGER/view_patient.dart';
import '../components.dart';
import 'Scan.dart';

class Home_Receptionist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase_Appo(),

      child:BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return Scaffold(
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
                          Text('Hallo,',style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(height: 5.0,),
                          Text('MR,Ziad',style: Theme.of(context).textTheme.bodyLarge),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor('8a86e2'),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: 180.0,
                            height: 160.0,
                            child: Lottie.network(
                                'https://assets1.lottiefiles.com/packages/lf20_fknfveir.json')),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Scan QR Code.',
                                style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Verification of patient information by qr code.',
                                style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              MaterialButton(
                                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Scan()));},
                                color: HexColor('ffe0f4'),
                                child: Text(
                                  'Scan now!',
                                  style: TextStyle(
                                      color: HexColor('8a86e2'),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),

                for(int i=0;i<Appointement_list.length;i++)
                  Dismissible(
                    key: Key(Appointement_list[i]['name'].toString()),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>View_patient_Manager(Appointement_list[i])));},
                        child: Container(
                          decoration: BoxDecoration(
                            color:  HexColor('ffe0f4'),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children:
                            [
                              CircleAvatar(backgroundColor: HexColor('8a86e2'),radius: 35.0,child: Text('${Appointement_list[i]['time']}',style: TextStyle(color: Colors.white70,fontSize: 15.0,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),),
                              SizedBox(width: 20.0,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('${Appointement_list[i]['name']}' ,style: TextStyle(color:  HexColor('32313a'),fontSize: 20.0,fontWeight: FontWeight.w600,),),
                                    Text('${Appointement_list[i]['date']}' ,style: TextStyle(color: Colors.grey[800],fontSize: 15.0,fontWeight: FontWeight.w500,),),
                                  ],
                                ),
                              ),
                               Icon(Icons.arrow_forward_outlined,color: Colors.grey[400],size: 40,)

                            ]),
                          ),
                        ),
                      ),
                    ),
                    onDismissed: (direction)
                    {

                    },
                  )
              ],
            ),
          );
        },

      )
    );
  }
}
