import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:hospital/PATIENTS/Login/login.dart';
import 'package:hospital/PATIENTS/Register/presentation/views_model/register_cubit.dart';
import 'package:intl/intl.dart';

class Register extends StatelessWidget {
  TextEditingController fname = TextEditingController(); //fname
  TextEditingController lname = TextEditingController(); //lname
  TextEditingController email = TextEditingController(); //email
  TextEditingController pass = TextEditingController(); //pass
  TextEditingController phone = TextEditingController(); //phone
  TextEditingController date = TextEditingController(); //date
  var Register_Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel!.success!) {
              showToast(
                  text: state.loginModel!.message!, state: ToastStates.SUCCESS);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            } else {
              showToast(
                  text: state.loginModel!.message!, state: ToastStates.ERROR);
            }
          } else if (state is RegisterFauilreState) {
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('Login Form',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
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
                        obscureText: !RegisterCubit.get(context).obsecure,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  RegisterCubit.get(context).cahngeicon();
                                },
                                child: RegisterCubit.get(context).obsecure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            labelText: 'PASSWORD',
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.lock),
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
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (Register_Key.currentState!.validate()) {
                            RegisterCubit.get(context).UserRegister(
                                email: email.text,
                                password: pass.text,
                                phone: phone.text,
                                first_name: fname.text,
                                last_name: lname.text,
                                birth_date: date.text);
                            print(date.text);
                          }
                        },
                        child: Text(
                          'SUBMIT',
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
