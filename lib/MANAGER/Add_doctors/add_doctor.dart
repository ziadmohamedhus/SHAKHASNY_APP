import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:intl/intl.dart';

import '../../DATABASE/cubit.dart';
import '../../DATABASE/states.dart';
import '../Home-M.dart';

class Add_doctor extends StatelessWidget {
  TextEditingController fname = TextEditingController(); //fname
  TextEditingController lname = TextEditingController(); //lname
  TextEditingController email = TextEditingController(); //email
  TextEditingController pass = TextEditingController(); //pass
  TextEditingController password_confirmation = TextEditingController(); //pass
  TextEditingController phone = TextEditingController(); //phone
  TextEditingController specifacation = TextEditingController(); //specifacation
  TextEditingController date = TextEditingController(); //date
  TextEditingController a7 = TextEditingController(); //experience
  TextEditingController a8 = TextEditingController(); //image
  TextEditingController fees = TextEditingController(); //image
  var Register_Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AddDoctorSuccessState) {
            showToast(text: state.message, state: ToastStates.SUCCESS);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeManager()));
          } else if (state is AddDoctorFauilreState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: Register_Key,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      //الشريط الاعلي
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('FILL OUT,',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('Add Doctor',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Icon(
                              Icons.account_circle,
                              size: 35.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: fname,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your First Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'FIRST NAME',
                            hintText: 'Enter your NAME',
                            prefixIcon: Icon(Icons.man_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: lname,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Last Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'LAST NAME',
                            hintText: 'Enter your last Name',
                            prefixIcon: Icon(Icons.family_restroom),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            hintText: 'Enter your Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            suffixIcon: Icon(Icons.check),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Password';
                          }
                          return null;
                        },
                        obscureText: AppCubit.get(context).textt,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                AppCubit.get(context).ic,
                              ),
                              onPressed: () {
                                AppCubit.get(context).obsecuree();
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: password_confirmation,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your password_confirmation';
                          }
                          return null;
                        },
                        obscureText: AppCubit.get(context).textt,
                        decoration: InputDecoration(
                            labelText: 'password_confirmation',
                            hintText: 'Enter your Password_confirmation',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                AppCubit.get(context).ic,
                              ),
                              onPressed: () {
                                AppCubit.get(context).obsecuree();
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Phone';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: phone,
                        decoration: InputDecoration(
                            labelText: 'PHONE',
                            hintText: 'Enter your Phone',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        controller: date,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Date of Birth';
                          }
                          return null;
                        },
                        onTap: () {
                          //لاظهار ساعة لتحديد الوقت
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.parse('1950-01-01'),
                                  lastDate: DateTime.now())
                              .then((value) {
                            date.text = DateFormat.yMMMd().format(value!);
                          });
                          //لاظهار نتيجة للتاريخ
                          // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.parse('2023-12-01'), lastDate: DateTime.parse('2000-01-01'));
                        },
                        decoration: InputDecoration(
                            labelText: 'DATE OF BIRTH',
                            hintText: 'Enter The Date',
                            prefixIcon: Icon(Icons.calendar_month_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                            value: "dentist",
                            child: Text("dentist"),
                          ),
                          DropdownMenuItem(
                            value: "cardiologist",
                            child: Text("cardiologist"),
                          ),
                          DropdownMenuItem(
                            value: "orthopedic",
                            child: Text("orthopedic"),
                          ),
                          DropdownMenuItem(
                            value: "nephrologist",
                            child: Text("nephrologist"),
                          ),
                          DropdownMenuItem(
                            value: "ophthalmologist",
                            child: Text("ophthalmologist"),
                          ),
                        ], //Ophthalmologist
                        onChanged: (value) {
                          specifacation.text = value.toString();
                          print(specifacation.text);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.menu),
                          labelText: "Specification",
                          hintText: "Specification",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: IconButton(
                            onPressed: () {
                              AppCubit.get(context).openGallery(context);
                            },
                            icon: Icon(Icons.image),
                          )),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: fees,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your Fees';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Fess',
                                  hintText: 'Enter The Fess',
                                  prefixIcon: Icon(Icons.money),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (Register_Key.currentState!.validate()) {
                            AppCubit.get(context).ADD_Doctor(
                                fees: fees.text,
                                password_confirmation:
                                    password_confirmation.text,
                                email: email.text,
                                password: pass.text,
                                phone: phone.text,
                                first_name: fname.text,
                                last_name: lname.text,
                                birth_date: date.text,
                                specialization: specifacation.text);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomeManager()));
                          }
                        },
                        child: Text(
                          'ADD',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
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
