import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/pharmacy/views/update_medicine.dart';

import '../constant.dart';
import '../pharmacy/data/pharmacy_model.dart';
import '../pharmacy/views/add_medicine.dart';

class Pharmacy_Manager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..GetMedicines(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              body: ConditionalBuilder(
            condition: state is! GetMedicinesLoadingState,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
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
                            Text('PHARMACY',
                                style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddMedicine()));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.deepPurple,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  for (int i = 0;
                      i < AppCubit.get(context).pharmacy_model!.data!.length;
                      i++)
                    InkWell(
                      onTap: () {
                        DataPharmacy data =
                            AppCubit.get(context).pharmacy_model!.data![i];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdateMedicne(data: data)));
                      },
                      child: Card(
                        color: HexColor('8a86e2'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        shadowColor: Colors.black,
                        elevation: 30.0,
                        child: ListTile(
                          title: Text(
                            '${AppCubit.get(context).pharmacy_model!.data![i].name}',
                            style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'Quantity: ${AppCubit.get(context).pharmacy_model!.data![i].quantity}',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          //الصورة في الاول
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[400],
                            backgroundImage: AppCubit.get(context)
                                        .pharmacy_model!
                                        .data![i]
                                        .image !=
                                    null
                                ? NetworkImage(
                                    "${imagebase}${AppCubit.get(context).pharmacy_model!.data![i].image!.path}")
                                : NetworkImage(
                                    "https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/enz/enz29011/y/23.jpg"),
                            radius: 25.0,
                          ),
                          //ايقونة في الاخر
                          trailing: Text(
                            '${AppCubit.get(context).pharmacy_model!.data![i].price} EG',
                            style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
