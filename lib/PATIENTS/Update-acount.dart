
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../components.dart';
import 'Login/login.dart';

class update_acount extends StatelessWidget {
  var up_Key = GlobalKey<FormState>() ;
  TextEditingController a1=TextEditingController();//fname
  TextEditingController a2=TextEditingController();//lname
  TextEditingController a3=TextEditingController();//email
  TextEditingController a4=TextEditingController();//phon
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
          appBar: AppBar(title: Text('UPDATE'),),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: up_Key,
              child: Column(children: [
                //الشريط الاعلي
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PLEASE,',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Enter new data',
                              style: Theme.of(context).textTheme.bodyLarge),
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
                  height: 35.0,
                ),
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
                  controller: a4,
                  decoration: InputDecoration(
                      labelText: 'PHONE',
                      hintText: 'Enter your Phone',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                  ),
                ),


                SizedBox(height: 15,),
                MaterialButton(onPressed: ()
                {
                  if (up_Key.currentState!.validate())
                  {
                    AppCubit.get(context).updateData(fname: a1.text, lname: a2.text, email: a3.text, phone: a4.text, id: patient["id"]);
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Login()));
                  }
                },
                  child: Text('SUBMIT',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                )
              ],),
            ),
          ),
        ),
      )
    );
  }
}
