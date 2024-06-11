
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/components.dart';
class new_appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase_Appo(),
      child:BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)=> Scaffold(
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
                        Text('Department of,',style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(height: 5.0,),
                        Text('${Doc['specification']}',style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      backgroundImage: AssetImage('asset/image/${Doc['image']}'),
                      radius: 25.0,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0,), //doctor
              for(int i=0;i<new_Appointement_list.length;i++)
                if (new_Appointement_list[i]["doctor"]==Doc['id'].toString())
                      Dismissible(
                        key: Key(new_Appointement_list[i]["name"] ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor('ffe0f4'),
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children:
                              [
                                CircleAvatar(
                                  backgroundColor: HexColor('8a86e2'),
                                  radius: 35.0,
                                  child: Text('${new_Appointement_list[i]['time']}',
                                    style: TextStyle(color: Colors.white70,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,),),
                                SizedBox(width: 20.0,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('${new_Appointement_list[i]['name']}',
                                        style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,),),
                                      Text('${Appointement_list[i]['date']}',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,),),
                                    ],
                                  ),
                                ),
                                IconButton(onPressed: ()
                                {
                                            AppCubit.get(context).updateData_Appo(status: 'done', id:new_Appointement_list[i]['id']);
                                },
                                  icon: Icon(Icons.check_box_sharp,
                                    color: Colors.lightGreen[800],),),
                                IconButton(onPressed: () {
                                  AppCubit.get(context).updateData_Appo(status: "cancel", id:new_Appointement_list[i]['id']);
                                },
                                  icon: Icon(Icons.archive,
                                    color: Colors.deepOrange[900],),),
                              ]),
                            ),
                          ),
                        ),
                        onDismissed: (direction) {

                        },
                      )

            ],
          ),
        ),
      ),
    );
  }
}
