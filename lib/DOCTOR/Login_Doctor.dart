
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/PATIENTS/Home-bage.dart';
import 'package:lottie/lottie.dart';
import '../DATABASE/cubit.dart';
import '../DATABASE/states.dart';
import '../components.dart';
import 'Home.dart';
class Login_Doctor extends StatelessWidget {

  var form_key=GlobalKey<FormState>();
  TextEditingController a1=TextEditingController();//Email
  TextEditingController a2=TextEditingController();//phone
  bool x=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase_doctor()..createDatabase_Appo(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context ,state){},
        builder: (context,state)=>Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child:
              Padding(padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: form_key,
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
                                Text('FILL OUT,',style: Theme.of(context).textTheme.bodyMedium),
                                SizedBox(height: 5.0,),
                                Text('Login Form',style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                            Icon(Icons.account_circle,size: 35.0,)
                          ],
                        ),
                      ),
                      Container(
                          width:600,
                          height: 300.0,
                          child: Lottie.network(
                              'https://lottie.host/243cd6f5-262c-4d98-8ac9-31ea42086c98/twRE2kVSGi.json')),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: a1,
                        validator:
                            (value)
                        {
                          bool t = false ;
                          if (value!.isEmpty)
                            return 'You have to enter the email';
                          for (int i = 0 ; i<doctorlist_Dentist.length ; i++)
                          {
                            if (a1.text == doctorlist_Dentist[i]['email']) {
                              t = true;
                              Doc = doctorlist_Dentist[i];
                            }
                          }
                          for (int i = 0 ; i<doctorlist_Cardiolo.length ; i++)
                          {
                          if (a1.text ==doctorlist_Cardiolo[i]['email']) {
                          t = true ;
                          Doc = doctorlist_Cardiolo[i] ;
                          }
                          }
                          for (int i = 0 ; i<doctorlist_Orthopedi.length ; i++)
                          {
                            if (a1.text ==doctorlist_Orthopedi[i]['email']) {
                              t = true ;
                              Doc = doctorlist_Orthopedi[i] ;
                            }
                          }
                          for (int i = 0 ; i<doctorlist_Nephrologist.length ; i++)
                          {
                            if (a1.text ==doctorlist_Nephrologist[i]['email']) {
                              t = true ;
                              Doc = doctorlist_Nephrologist[i] ;
                            }
                          }
                          for (int i = 0 ; i<doctorlist_Ophthalmologist.length ; i++)
                          {
                            if (a1.text ==doctorlist_Ophthalmologist[i]['email']) {
                              t = true ;
                              Doc = doctorlist_Ophthalmologist[i] ;
                            }
                          }
                          if (t== false)
                          {
                            return 'Email isn\'t found' ;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'EMAIL',
                          hintText: 'Enter your Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          suffixIcon: Icon(Icons.check),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),

                        ),
                      ),
                      SizedBox(height: 15.0,),
                      TextFormField(
                        controller: a2,
                        obscureText: AppCubit.get(context).textt,
                        validator: ( value)
                        {
                          bool t = false ;
                          if (value!.isEmpty)
                            return 'You have to enter the Password';
                          for (int i = 0 ; i<doctorlist_Dentist.length ; i++)
                          {
                            if (a2.text == doctorlist_Dentist[i]['password']) {
                              t = true;
                            }
                          }
                          for (int i = 0 ; i<doctorlist_Cardiolo.length ; i++)
                          {
                            if (a2.text ==doctorlist_Cardiolo[i]['password']) {
                              t = true ;
                            }
                          }
                          for (int i = 0 ; i<doctorlist_Orthopedi.length ; i++)
                          {
                            if (a2.text ==doctorlist_Orthopedi[i]['password']) {
                              t = true ;
                            }
                          }
                          for (int i = 0 ; i<doctorlist_Nephrologist.length ; i++)
                          {
                            if (a2.text ==doctorlist_Nephrologist[i]['password']) {
                              t = true ;
                            }
                          }
                          for (int i = 0 ; i<doctorlist_Ophthalmologist.length ; i++)
                          {
                            if (a2.text ==doctorlist_Ophthalmologist[i]['password']) {
                              t = true ;
                            }
                          }
                          if (t== false)
                          {
                            return 'Password isn\'t found' ;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(icon: Icon(AppCubit.get(context).ic,),
                              onPressed: ()
                              {
                                AppCubit.get(context).obsecuree() ;
                              },),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),

                      SizedBox(height: 15,),

                      MaterialButton(onPressed: ()
                      {
                        if(form_key.currentState!.validate())
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDoctor()));
                        }
                      },child: Text('Login',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ) ;

  }


}
