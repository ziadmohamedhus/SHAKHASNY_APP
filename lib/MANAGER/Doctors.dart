
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import 'Doctor-parts/dentist.dart';
import 'Doctor-parts/eye.dart';
import 'Doctor-parts/hart.dart';
import 'Doctor-parts/kedny.dart';
import 'Doctor-parts/poon.dart';

class Doctors_for_manager extends StatelessWidget {
List<Widget> icons=[
  Tab(
    height: 80,
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        
        color:Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent[100]!.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset('asset/icon/mh.png',),
    ),

  ),
  Tab(
    height: 80,
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(

        color:Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent[100]!.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset('asset/icon/mk.png',),
    ),
  ),
  Tab(
    height: 80,
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(

        color:Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent[100]!.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset('asset/icon/mp.png',),
    ),
  ),
  Tab(
    height: 80,
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(

        color:Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent[100]!.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset('asset/icon/mt.png',),
    ),
  ),
  Tab(
    height: 80,
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(

        color:Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent[100]!.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset('asset/icon/me.png',),
    ),
  ),

];
List<Widget> pages=[

  hart(),
  kedny(),
  poon(),
  teeth(),
  eye(),


];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> AppCubit()..createDatabase_doctor(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context , state)=>DefaultTabController(
          length: icons.length,
          child: Scaffold(
              appBar: AppBar(),
              body: SafeArea(

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
                              Text('SHOW,',style: Theme.of(context).textTheme.bodyMedium,),
                              SizedBox(height: 5.0,),
                              Text('All Doctors',style: Theme.of(context).textTheme.bodyLarge),
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
                    //القوائم
                    TabBar(tabs: icons),
                    //عرض القوائم
                    Expanded(child: TabBarView(children: pages))




                  ],
                ),

              )
          ),
        ),
      ),
    );
  }
}
