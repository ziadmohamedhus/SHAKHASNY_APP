import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/COMPONENTS/components/default_bottom.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/MANAGER/Home-M.dart';

import '../../MANAGER/Add_doctors/Data/all_doctor_model.dart';
import '../../constant.dart';

class WorkHourScreen extends StatelessWidget {
  WorkHourScreen({Key? key, required this.doc}) : super(key: key);
  var work_hour = TextEditingController();
  var start_time = TextEditingController();
  var end_time = TextEditingController();
  final DataDoctor doc;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is GetworkDoctorSuccessState) {
          showToast(text: state.message, state: ToastStates.SUCCESS);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeManager()));
        } else if (state is GetworkDoctorFauilreState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Working Hour for ,',
                              style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Dr/${doc.firstName} ${doc.lastName}',
                                style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: doc.image != null
                              ? NetworkImage("${imagebase}${doc.image!.path}")
                              : NetworkImage("${copyimage}"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) return "please enter the Day";
                    },
                    items: [
                      DropdownMenuItem(
                        value: "Saturday",
                        child: Text("Saturday"),
                      ),
                      DropdownMenuItem(
                        value: "Sunday",
                        child: Text("Sunday"),
                      ),
                      DropdownMenuItem(
                        value: "Monday",
                        child: Text("Monday"),
                      ),
                      DropdownMenuItem(
                        value: "Tuesday",
                        child: Text("Tuesday"),
                      ),
                      DropdownMenuItem(
                        value: "Wednesday",
                        child: Text("Wednesday"),
                      ),
                      DropdownMenuItem(
                        value: "Thursday",
                        child: Text("Thursday"),
                      ),
                      DropdownMenuItem(
                        value: "Friday",
                        child: Text("Friday"),
                      ),
                    ], //Ophthalmologist
                    onChanged: (value) {
                      work_hour.text = value.toString();
                      print(work_hour.text);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.menu),
                      labelText: "Day Work",
                      hintText: "Day Work",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter the Start_time';
                      }
                      return null;
                    },
                    controller: start_time,
                    onTap: () {
                      //لاظهار ساعة لتحديد الوقت
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        // لطباعة الوقت في صندوق الادخال
                        //start_time.text = value!.format(context).toString();
                        start_time.text = value!.hour.toString();
                        if (start_time.text.length == 1)
                          start_time.text = "0" + value!.hour.toString();
                        start_time.text += ":";
                        start_time.text += value!.minute.toString();
                        if (value.minute.toString().length == 1) {
                          start_time.text += '0';
                        }
                      });
                      //لاظهار نتيجة للتاريخ
                      // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.parse('2023-12-01'), lastDate: DateTime.parse('2000-01-01'));
                    },
                    decoration: InputDecoration(
                        labelText: "From",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter the End_time';
                      }
                      return null;
                    },
                    controller: end_time,
                    onTap: () {
                      //لاظهار ساعة لتحديد الوقت
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        end_time.text = "";
                        // لطباعة الوقت في صندوق الادخال
                        end_time.text = value!.hour.toString();
                        if (end_time.text.length == 1)
                          end_time.text = "0" + value!.hour.toString();
                        end_time.text += ":";
                        end_time.text += value!.minute.toString();
                        if (value.minute.toString().length == 1) {
                          end_time.text += '0';
                        }
                      });
                      //لاظهار نتيجة للتاريخ
                      // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.parse('2023-12-01'), lastDate: DateTime.parse('2000-01-01'));
                    },
                    decoration: InputDecoration(
                        labelText: "End",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultButton(
                    title: "Confirm",
                    onPressed: () {
                      AppCubit.get(context).workhourdoctor(
                          day: work_hour.text,
                          id: doc.id.toString(),
                          start_date: start_time.text,
                          end_date: end_time.text);
                    },
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
