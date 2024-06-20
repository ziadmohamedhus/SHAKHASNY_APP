import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/pharmacy/data/pharmacy_model.dart';

import '../constant.dart';
import '../pharmacy/buy_medicne.dart';

class Pharmacy extends StatelessWidget {
  List Pharmacy_data = [
    {
      'name': 'Panadol',
      'money': 50,
      'years': 'Temporary pain reliever',
      'image': 'asset/image/m1.jpeg'
    },
    {
      'name': 'Panadol +',
      'years': 'Temporary pain reliever',
      'money': 37,
      'image': 'asset/image/m2.jpeg'
    },
    {
      'name': 'Panadol Extra',
      'years': 'Temporary pain reliever',
      'money': 60,
      'image': 'asset/image/m3.jpg'
    },
    {
      'name': 'Panadol Night',
      'years': 'Temporary pain reliever',
      'money': 20,
      'image': 'asset/image/m4.jpg'
    },
    {
      'name': 'Panadol Advance',
      'years': 'Temporary pain reliever',
      'money': 40,
      'image': 'asset/image/m5.jpg'
    },
    {
      'name': 'Panadol Actifast',
      'years': 'Temporary pain reliever',
      'money': 50,
      'image': 'asset/image/m6.jpg'
    },
    {
      'name': 'Panadol A',
      'years': 'Temporary pain reliever',
      'money': 30,
      'image': 'asset/image/m7.jpg'
    },
    {
      'name': 'Panadol B',
      'years': 'Temporary pain reliever',
      'money': 54,
      'image': 'asset/image/m8.jpg'
    },
    {
      'name': 'Panadol C',
      'years': 'Temporary pain reliever',
      'money': 43,
      'image': 'asset/image/m1.jpeg'
    },
    {
      'name': 'Panadol D',
      'years': 'Temporary pain reliever',
      'money': 50,
      'image': 'asset/image/m3.jpg'
    },
  ];
  List<String> content = <String>[
    'panadol',
    'panadol +',
    'panadol extra',
    'panadol night',
    'panadol advance',
    'panadol actifast',
    'panadol a',
    'panadol b',
    'panadol c',
    'panadol d'
  ];
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
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      Text('Search for:'),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HexColor('ffe0f4').withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.deepPurple, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  for (int i = 0;
                      i < AppCubit.get(context).pharmacy_model!.data!.length;
                      i++)
                    InkWell(
                      onTap: () {
                        DataPharmacy name =
                            AppCubit.get(context).pharmacy_model!.data![i];
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => View_medicene(
                                  data: name,
                                )));
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
                            'EXpiry Date: ${AppCubit.get(context).pharmacy_model!.data![i].expiryDate}',
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
