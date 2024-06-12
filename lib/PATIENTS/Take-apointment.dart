
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:intl/intl.dart';

import 'Appointment-done.dart';

class Take_apointment extends StatelessWidget {
  var form_key = GlobalKey<FormState>() ;
Map Ziad ={};
  Take_apointment(Map t)
{
  Ziad = t ;
}
  TextEditingController a1=TextEditingController(); // name
  TextEditingController a2=TextEditingController(); // phone
  TextEditingController a3=TextEditingController(); // doctor name
  TextEditingController a4=TextEditingController(); // date
  TextEditingController a5=TextEditingController(); // time
  TextEditingController a6=TextEditingController(); // country

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase_Appo(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context ,state)=> Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child:
              Padding(padding: const EdgeInsets.all(10.0),
                child: Form(
                  key:form_key ,
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
                                Text('FILL OUT,',style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                                SizedBox(height: 5.0,),
                                Text('Patient Form',style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Icon(Icons.format_list_bulleted_outlined,size: 35.0,)
                          ],
                        ),
                      ),
                      SizedBox(height: 35,),
                      TextFormField(
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter your Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: a1,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your Name',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))

                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter your Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: a2,
                        decoration: InputDecoration(
                            labelText: 'PHONE',
                            hintText: 'Enter your Phone',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: a3,
                        onTap: (){
                          a3.text=Ziad["first"]+" "+Ziad["second"] ;
                        },
                        readOnly:true ,
                        decoration: InputDecoration(
                            labelText: 'Doctor NAME',
                            prefixIcon: Icon(Icons.h_mobiledata),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter Date';
                          }
                          return null;
                        },
                        controller: a4,
                        onTap: ()
                        {
                          //لاظهار ساعة لتحديد الوقت
                          showDatePicker(context: context, initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2024-12-29')).then((value)
                          {
                            a4.text=DateFormat.yMMMd().format(value!);
                          });
                          //لاظهار نتيجة للتاريخ
                          // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.parse('2023-12-01'), lastDate: DateTime.parse('2000-01-01'));
                        },
                        decoration: InputDecoration(
                            labelText: 'DATE',
                            hintText: 'Enter The Date',
                            prefixIcon: Icon(Icons.calendar_month_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter the Time';
                          }
                          return null;
                        },
                        controller: a5,
                        onTap: ()
                        {
                          //لاظهار ساعة لتحديد الوقت
                          showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value)
                          {
                            // لطباعة الوقت في صندوق الادخال
                            a5.text=value!.format(context).toString();
                          });
                          //لاظهار نتيجة للتاريخ
                          // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.parse('2023-12-01'), lastDate: DateTime.parse('2000-01-01'));
                        },
                        decoration: InputDecoration(
                            labelText: 'TIME',
                            hintText: 'Enter The Time',
                            prefixIcon: Icon(Icons.watch_later_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter the Time';
                          }
                          return null;
                        },
                        controller: a6,
                        decoration: InputDecoration(
                            labelText: 'COUNTRY',
                            hintText: 'Enter your Country',
                            prefixIcon: Icon(Icons.location_city_rounded),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 20,),
                      MaterialButton(onPressed: ()
                      {
                        if(form_key.currentState!.validate())
                        {
                           AppCubit.get(context).insertToDatabase_Appo(name: a1.text, phone: a2.text, doctor: Ziad["id"].toString(), date: a4.text, time: a5.text, country: a6.text) ;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Appointment_done(name: a1.text,phone: a2.text,doctor: a3.text,date: a4.text,time: a5.text,country: a6.text,)));
                        }
                      },child: Text('SUBMIT',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
