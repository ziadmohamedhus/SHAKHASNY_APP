import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DOCTOR/Home.dart';
import 'package:hospital/MANAGER/views_model/login_man_cubit.dart';
import 'package:lottie/lottie.dart';

import '../COMPONENTS/styles/custom_flutter_toast.dart';
import '../constant.dart';

class Login_Doctor extends StatelessWidget {
  var form_key = GlobalKey<FormState>();
  TextEditingController a1 = TextEditingController(); //Email
  TextEditingController a2 = TextEditingController(); //phone
  bool x = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginManCubit(),
      child: BlocConsumer<LoginManCubit, LoginManState>(
        listener: (context, state) {
          if (state is LoginManSuccessState) {
            if (state.loginModel!.success!) {
              if (state.loginModel.data!.roleId == 2) {
                patient_model = state.loginModel!;
                token =
                    "${state.loginModel.tokenType!}${state.loginModel.accessToken!}";
                showToast(
                    text: state.loginModel.message!,
                    state: ToastStates.SUCCESS);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeDoctor()));
              } else {
                showToast(text: "Unathorized", state: ToastStates.ERROR);
              }
            } else {
              showToast(
                  text: state.loginModel.message!, state: ToastStates.ERROR);
            }
          } else if (state is LoginManFauilreState) {
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
                                Text('Login Form',
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
                      Container(
                          width: 600,
                          height: 300.0,
                          child: Lottie.network(
                              'https://lottie.host/243cd6f5-262c-4d98-8ac9-31ea42086c98/twRE2kVSGi.json')),
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
                        obscureText: !LoginManCubit.get(context).obsecure,
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'You have to enter the Password';
                        },
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  LoginManCubit.get(context).cahngeicon();
                                },
                                child: LoginManCubit.get(context).obsecure
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

                      MaterialButton(
                        onPressed: () {
                          if (form_key.currentState!.validate()) {
                            LoginManCubit.get(context).UserLoginMan(
                                email: a1.text, password: a2.text);
                          }
                        },
                        child: Text(
                          'Login',
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
