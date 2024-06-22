import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../constant.dart';
import '../pharmacy/buy_medicne.dart';
import '../pharmacy/views/Solid_Medicine.dart';

class Pharmacy extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

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
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
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
                              SizedBox(height: 5.0),
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
                                      builder: (context) => SoildMedicine()));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[400],
                              backgroundImage: AssetImage('asset/icon/9.png'),
                              radius: 30.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onChanged: (value) {
                        AppCubit.get(context).filterMedicines(value);
                      },
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            AppCubit.get(context).filteredMedicines.length,
                        itemBuilder: (context, i) {
                          var medicine =
                              AppCubit.get(context).filteredMedicines[i];
                          return InkWell(
                            onTap: medicine.quantity! > 0
                                ? () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                View_medicene(data: medicine)));
                                  }
                                : () {
                                    showToast(
                                        text:
                                            "There is no quantity of this medicine",
                                        state: ToastStates.ERROR);
                                  },
                            child: Card(
                              color: HexColor('8a86e2'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              shadowColor: Colors.black,
                              elevation: 30.0,
                              child: ListTile(
                                title: Text(
                                  '${medicine.name}',
                                  style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  'Expiry Date: ${medicine.expiryDate}',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[400],
                                  backgroundImage: medicine.image != null
                                      ? NetworkImage(
                                          "${imagebase}${medicine.image!.path}")
                                      : NetworkImage(
                                          "https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/enz/enz29011/y/23.jpg"),
                                  radius: 25.0,
                                ),
                                trailing: Text(
                                  '${medicine.price} EG',
                                  style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
