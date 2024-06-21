import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/START/Start.dart';
import 'package:lottie/lottie.dart';

import '../PATIENTS/Department_of_doc/List-Doctor6.dart';
import '../constant.dart';
import '../pharmacy/views/Accounts_Medicine.dart';
import 'Add_doctors/add_doctor.dart';
import 'Doctors.dart';
import 'all_patient.dart';

class HomeManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..getalldoctor(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
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
                              Text(
                                'HELLO,',
                                style: TextStyle(
                                    color: HexColor('32313a'),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('Mr.Ziad Ahmed',
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
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Start()));
                              },
                              child: Icon(Icons.exit_to_app)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //سيرش
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'How can we help you boss..',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //رسمة
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      child: Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_49rdyysj.json'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //اعلانات
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: HexColor('8a86e2'),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width: 180.0,
                                    height: 160.0,
                                    child: Lottie.network(
                                        'https://assets1.lottiefiles.com/private_files/lf30_hdiNFs.json')),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Add a new doctor.',
                                        style: TextStyle(
                                            color: HexColor('32313a'),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'new doctor as an employee in the hospital.',
                                        style: TextStyle(
                                            color: HexColor('32313a'),
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Add_doctor()));
                                        },
                                        color: HexColor('ffe0f4'),
                                        child: Text(
                                          'Add now!',
                                          style: TextStyle(
                                              color: HexColor('8a86e2'),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //المرضي والاطباء
                          Container(
                            height: 190.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Doctors_for_manager()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: HexColor('ffe0f4'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 180.0,
                                            height: 140.0,
                                            child: Lottie.network(
                                                'https://assets10.lottiefiles.com/private_files/lf30_4FGi6N.json')),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'all doctors',
                                          style: TextStyle(
                                              color: HexColor('32313a'),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Pharmacy_Manager()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: HexColor('ffe0f4'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 180.0,
                                            height: 140.0,
                                            child: Lottie.network(
                                                'https://assets5.lottiefiles.com/packages/lf20_3xgahwks.json')),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'Pharmacy',
                                          style: TextStyle(
                                              color: HexColor('32313a'),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                AccountMedicines()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: HexColor('ffe0f4'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 180.0,
                                            height: 140.0,
                                            child: Lottie.network(
                                                'https://assets9.lottiefiles.com/packages/lf20_CueyLB.json')),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'Orders',
                                          style: TextStyle(
                                              color: HexColor('32313a'),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //الدكاترة عنوان
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Doctors',
                                  style: TextStyle(
                                      color: HexColor('32313a'),
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                All_doctor(
                                                  model: all_doctor_model!,
                                                )));
                                  },
                                  child: Text(
                                    'See more',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // الدكاترة
                    ConditionalBuilder(
                      condition: all_doctor_model != null,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      Colors.pinkAccent[100]!.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        CircleAvatar(
                                          radius: 65.0,
                                          backgroundImage: all_doctor_model!
                                                      .data![0].image !=
                                                  null
                                              ? NetworkImage(
                                                  "${imagebase}${all_doctor_model!.data![0].image!.path}")
                                              : NetworkImage("${copyimage}"),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'DR.${all_doctor_model!.data![0].firstName} ${all_doctor_model!.data![0].lastName}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${all_doctor_model!.data![0].doctor!.specialization}',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      Colors.pinkAccent[100]!.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        CircleAvatar(
                                          radius: 65.0,
                                          backgroundImage: all_doctor_model!
                                                      .data![1].image !=
                                                  null
                                              ? NetworkImage(
                                                  "${imagebase}${all_doctor_model!.data![1].image!.path}")
                                              : NetworkImage("${copyimage}"),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'DR.${all_doctor_model!.data![1].firstName} ${all_doctor_model!.data![1].lastName}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${all_doctor_model!.data![1].doctor!.specialization}',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      fallback: (context) => CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
