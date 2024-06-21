import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../data/solid_medicine_model.dart';

class SoildMedicine extends StatelessWidget {
  SoildMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..GetSolidMedicines(),
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
                  cubit.solid_medicine_model?.data != null,
              builder: (context) => ListView.builder(
                itemCount: cubit.solid_medicine_model?.data?.length ?? 0,
                itemBuilder: (context, index) => Apponitments(context,
                    data: cubit.solid_medicine_model!.data![index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget Apponitments(context, {required DataSolidMedicine data}) {
    return Padding(
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
              "Medicine Name : ${data.medicine!.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Expiry Date : ${data.medicine!.expiryDate}",
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "ID : ${data.paymentId!}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Quantity : ${data.quantity}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Total Price : ${data.amount! / 100} EG",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
