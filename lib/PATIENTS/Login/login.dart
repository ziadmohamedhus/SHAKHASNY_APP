import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/PATIENTS/Home-bage.dart';
import 'package:hospital/PATIENTS/Login/preseentation/views_model/login_cubit.dart';
import 'package:hospital/constant.dart';
import 'package:lottie/lottie.dart';

import '../../COMPONENTS/styles/custom_flutter_toast.dart';
import '../Register/Register.dart';

class Login extends StatelessWidget {
  var form_key = GlobalKey<FormState>();
  TextEditingController a1 = TextEditingController(); //male

  TextEditingController a2 = TextEditingController(); //phone

  bool x = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel!.success!) {
              model = state.loginModel!;
              showToast(
                  text: state.loginModel!.message!, state: ToastStates.SUCCESS);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Home_bage()));
            } else {
              showToast(
                  text: state.loginModel!.message!, state: ToastStates.ERROR);
            }
          } else if (state is LoginFauilreState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: form_key,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          //الشريط الاعلي
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('FILL OUT,',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text('Login Form',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                                Icon(
                                  Icons.account_circle,
                                  size: 35.0,
                                )
                              ],
                            ),
                          ),
                          // SizedBox(height: 35,),
                          Container(
                              width: 600,
                              height: 300.0,
                              child: Lottie.network(
                                  'https://lottie.host/243cd6f5-262c-4d98-8ac9-31ea42086c98/twRE2kVSGi.json')),
                          //SizedBox(height: 35,),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: a1,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'You have to enter the email';
                            },
                            decoration: InputDecoration(
                              labelText: 'EMAIL',
                              hintText: 'Enter your Email',
                              prefixIcon: Icon(Icons.email_outlined),
                              suffixIcon: Icon(Icons.check),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: a2,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'You have to enter the password';
                            },
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                hintText: 'Enter your Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          MaterialButton(
                            onPressed: () {
                              if (form_key.currentState!.validate()) {
                                LoginCubit.get(context).UserLogin(
                                    email: a1.text, password: a2.text);
                              }
                            },
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Register()));
                                },
                                child: Text(
                                  'Register Now',
                                ),
                              ),
                            ],
                          ),
                        ],
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
