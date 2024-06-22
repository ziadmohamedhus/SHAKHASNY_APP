import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../MANAGER/Add_doctors/Data/all_doctor_model.dart';
import 'Appointment-done.dart';

class Take_apointment extends StatelessWidget {
  var form_key = GlobalKey<FormState>();
  final DataDoctor doc;
  final String day_work;
  TextEditingController doctor_name = TextEditingController(); // doctor_name
  TextEditingController day = TextEditingController(); // date
  TextEditingController time = TextEditingController(); // time
  TextEditingController country = TextEditingController();

  Take_apointment({Key? key, required this.doc, required this.day_work})
      : super(key: key); // country

  @override
  Widget build(BuildContext context) {
    doctor_name.text = "${doc.firstName} ${doc.lastName}";
    day.text = day_work;
    return BlocProvider(
        create: (context) =>
            AppCubit()..gettimedoctor(id: doc.id.toString(), day: day.text),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is MakeAppointmentSuccessState) {
              showToast(text: state.message, state: ToastStates.SUCCESS);
              AppCubit.get(context)
                  .gettimedoctor(id: doc.id.toString(), day: day.text);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Appointment_done(
                            doc: doc,
                            time: time.text,
                            date: day.text,
                            reason: country.text,
                          )));
            } else if (state is MakeAppointmentFauilreState) {
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
                                  Text('Take Appointment',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Icon(
                                Icons.format_list_bulleted_outlined,
                                size: 35.0,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        ConditionalBuilder(
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                          condition: state is! GettimedoctorLoadingState &&
                              AppCubit.get(context).time_doc!.data != null,
                          builder: (context) => SizedBox(
                            height: 100,
                            child: ListView.builder(
                              itemBuilder: (context, index) => timeofdoctor(
                                  AppCubit.get(context).time_doc!.data![index]),
                              itemCount:
                                  AppCubit.get(context).time_doc!.data?.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: doctor_name,
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: 'Doctor NAME',
                              prefixIcon: Icon(Icons.h_mobiledata),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: day,
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: 'Day',
                              prefixIcon: Icon(Icons.view_day),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please Choice The Time';
                            }
                            return null;
                          },
                          controller: time,
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: 'Time',
                              prefixIcon: Icon(Icons.watch_later),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the Reason';
                            }
                            return null;
                          },
                          controller: country,
                          decoration: InputDecoration(
                              labelText: 'REASON',
                              hintText: 'Enter your REASON',
                              prefixIcon: Icon(Icons.question_mark_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (form_key.currentState!.validate()) {
                              AppCubit.get(context).MakeAppointment(
                                  doctor_id: doc.id.toString(),
                                  date: day.text,
                                  time: time.text,
                                  reason: country.text);
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
        ));
  }

  Widget timeofdoctor(String time2) {
    return InkWell(
      onTap: () {
        time.text = time2.substring(0, time2.length - 3);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.pinkAccent[100]!.withOpacity(0.5),
          ),
          width: 80,
          height: 40,
          child: Center(child: Text(time2)),
        ),
      ),
    );
  }
}
