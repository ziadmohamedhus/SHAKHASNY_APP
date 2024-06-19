import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/components.dart';

class new_appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getallappointments(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // if (state is AppointmentsDoctorSuccessState) {
          //   showToast(text: state.message, state: ToastStates.SUCCESS);
          //
          // } else if (state is AppointmentsDoctorFauilreState) {
          //   showToast(text: state.error, state: ToastStates.ERROR);
          // }
        },
        builder: (context, state) => Scaffold(
          body: ConditionalBuilder(
            condition: AppCubit.get(context).new_appointments.length != 0,
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
            builder: (context) => ListView(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Department of,',
                              style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('specification',
                              style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold)),
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
                  height: 20.0,
                ), //doctor
                for (int i = 0;
                    i < AppCubit.get(context).new_appointments.length;
                    i++)
                  Dismissible(
                    key: Key(AppCubit.get(context)
                        .new_appointments[i]
                        .time
                        .toString()),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor('ffe0f4'),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundColor: HexColor('8a86e2'),
                              radius: 35.0,
                              child: Text(
                                '${AppCubit.get(context).new_appointments[i].time}',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${AppCubit.get(context).new_appointments[i].patient!.firstName} ${AppCubit.get(context).new_appointments[i].patient!.lastName}',
                                    style: TextStyle(
                                      color: HexColor('32313a'),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${AppCubit.get(context).new_appointments[i].date}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                AppCubit.get(context).accept_appointment(id: AppCubit.get(context).new_appointments[i].id.toString());
                              },
                              icon: Icon(
                                Icons.check_box_sharp,
                                color: Colors.lightGreen[800],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                AppCubit.get(context).reject_appointment(id: AppCubit.get(context).new_appointments[i].id.toString());

                              },
                              icon: Icon(
                                Icons.archive,
                                color: Colors.deepOrange[900],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    onDismissed: (direction) {},
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
