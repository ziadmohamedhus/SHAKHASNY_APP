
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../DATABASE/cubit.dart';
import '../../DATABASE/states.dart';
import '../../components.dart';
import '../Login/login.dart';

class Register extends StatelessWidget {

  TextEditingController a1=TextEditingController();//fname
  TextEditingController a2=TextEditingController();//lname
  TextEditingController a3=TextEditingController();//email
  TextEditingController a4=TextEditingController();//pass
  TextEditingController a5=TextEditingController();//phone
  TextEditingController a6=TextEditingController();//date
  var Register_Key = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context , state){},
        builder: (context ,state)=>Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child:
              Padding(padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: Register_Key,
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
                      SizedBox(height: 35,),
                      TextFormField(
                        controller: a1,
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter your First Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'FIRST NAME',
                            hintText: 'Enter your NAME',
                            prefixIcon: Icon(Icons.man_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: a2,
                        validator:
                            (  value){
                          if (value!.isEmpty) {
                            return'please enter your Last Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'LAST NAME',
                            hintText: 'Enter your last Name',
                            prefixIcon: Icon(Icons.family_restroom),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: a3,
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            hintText: 'Enter your Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            suffixIcon: Icon(Icons.check),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      TextFormField(
                        controller: a4,
                        validator:
                            (  value){
                          if (value!.isEmpty) {
                            return'please enter your Password';
                          }
                          return null;
                        },
                        obscureText: AppCubit.get(context).textt,
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
                      TextFormField(
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter your Phone';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: a5,
                        decoration: InputDecoration(
                            labelText: 'PHONE',
                            hintText: 'Enter your Phone',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 15,),

                      TextFormField(
                        controller: a6,
                        validator:
                            (  value){
                          if (value!.isEmpty) {
                            return'please enter your Date of Birth';
                          }
                          return null;
                        },
                        onTap: ()
                        {
                          //لاظهار ساعة لتحديد الوقت
                          showDatePicker(context: context, initialDate: DateTime.now(),
                              firstDate: DateTime.parse('1950-01-01'),
                              lastDate: DateTime.now()).then((value)
                          {
                            a6.text=DateFormat.yMMMd().format(value!);
                          });
                          //لاظهار نتيجة للتاريخ
                          // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.parse('2023-12-01'), lastDate: DateTime.parse('2000-01-01'));
                        },
                        decoration: InputDecoration(
                            labelText: 'DATE OF BIRTH',
                            hintText: 'Enter The Date',
                            prefixIcon: Icon(Icons.calendar_month_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                        ),
                      ),
                      SizedBox(height: 20,),
                      MaterialButton(onPressed: ()
                      {
                        if (Register_Key.currentState!.validate())
                        {
                          AppCubit.get(context).insertToDatabase(first: a1.text, second: a2.text, email: a3.text, password: a4.text, phone: a5.text);
                          print(patientlist) ;
                          Navigator.push(context , MaterialPageRoute(builder: (context)=>Login()));
                        }
                      },child: Text('SUBMIT',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
