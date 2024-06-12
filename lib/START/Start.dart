
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../DOCTOR/Home.dart';
import '../DOCTOR/Login_Doctor.dart';
import '../MANAGER/Home-M.dart';
import '../MANAGER/Register_manager.dart';
import '../PATIENTS/Home-bage.dart';
import '../PATIENTS/Login/login.dart';
import '../RESCEPTION/Login-Reseptionist.dart';

class Start extends StatefulWidget {

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
int cur_step=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('START'),
        centerTitle: true,
      ),
      body:Center(
        child: Stepper(
          steps: [
            Step(
              isActive: cur_step==0,
                title: Text('Patient',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 20),),
                content:Text('Login as a patient',style: TextStyle(color: Colors.pink[200]),)
            ),
            Step(
                isActive: cur_step==1,
                title: Text('Doctor',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 20),),
                content:Text('Login as a Doctor',style: TextStyle(color: Colors.pink[200]),)
            ),
            Step(
                isActive: cur_step==2,
                title: Text('Manager',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 20)),
                content:Text('Login as a Manager',style: TextStyle(color: Colors.pink[200]),)
            ),
            Step(
                isActive: cur_step==3,
                title: Text('Receptionist',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 20)),
                content:Text('Login as a Receptionist',style: TextStyle(color: Colors.pink[200]),)
            ),
          ],
          onStepTapped: (int newindex)
          {
            setState(() {
              cur_step=newindex;
            });
          },
          currentStep: cur_step,
          onStepContinue: (){
            if(cur_step==0)
              { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Login()));}
            else if(cur_step==1)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Doctor())) ;
              }
            else if(cur_step==2)
            {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Login_Manager()));}
            else if(cur_step==3)
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Login_Reseption()));
            }
          },
          onStepCancel: (){
            if(cur_step!=3)
            { setState(() {
              cur_step++;
            });}
            else if(cur_step==3)
            {setState(() {
              cur_step=0;
            });}
          },
        ),
      )
    );
  }
}
