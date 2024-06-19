import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../../constant.dart';

class Cardiologist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) => ConditionalBuilder(
          fallback: (context) => CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
          condition: Cardiologistlist!.isNotEmpty,
          builder: (BuildContext context) => Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Department of,',
                              style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Cardiologist',
                              style: TextStyle(
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
                SizedBox(
                  height: 20.0,
                ),
                for (int i = 0; i < Cardiologistlist!.length; i++)
                  Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    elevation: 30.0,
                    child: ListTile(
                      title: Text(
                        'DR: ${Cardiologistlist![i].firstName} ${Cardiologistlist![i].lastName}',
                        style: TextStyle(
                          color: HexColor('32313a'),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Phone ${Cardiologistlist![i].phone}',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      //الصورة في الاول
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        backgroundImage: AssetImage('asset/image/1.jpg'),
                        radius: 25.0,
                      ),
                      //ايقونة في الاخر
                      trailing: Icon(Icons.more_horiz_outlined),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         View_doctor(doctorlist_Dentist[i])));
                      },
                    ),
                  ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
