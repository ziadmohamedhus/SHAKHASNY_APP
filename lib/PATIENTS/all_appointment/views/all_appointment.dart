import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../../../payment/views/payment.dart';
import '../data/appointment_model.dart';

class AppointmentStatus extends StatelessWidget {
  AppointmentStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..Getappopatient(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('SHAKHSNI',
                  style: TextStyle(
                      color: HexColor('ffe0f4'), fontWeight: FontWeight.bold)),
              centerTitle: true,
            ),
            body: ConditionalBuilder(
              fallback: (context) => Center(child: CircularProgressIndicator()),
              condition: state is! GetAppPatientLoadingState &&
                  cubit.patientinfo?.data != null,
              builder: (context) => ListView.builder(
                itemCount: cubit.patientinfo?.data?.length ?? 0,
                itemBuilder: (context, index) => Apponitments(context,
                    data: cubit.patientinfo!.data![index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget Apponitments(context, {required DataApp data}) {
    return InkWell(
      onTap: data.paid == 0
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomCreditCard(
                            id: data.id.toString(),
                          )));
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor('ffe0f4'),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Dr: ${data.doctor!.firstName} ${data.doctor!.lastName}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Time : ${data.time}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Date : ${data.date}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Reason : ${data.reason}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Status : ${data.status}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: data.status == "accepted"
                        ? Colors.green
                        : data.status == "rejected"
                            ? Colors.red
                            : Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Money : ${data.price} EG",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Paid : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  data.paid == 1
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.warning,
                          color: Colors.red,
                        )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
