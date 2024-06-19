import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/constant.dart';
import 'package:lottie/lottie.dart';

import 'Appointments.dart';
import 'Done.dart';
import 'canceled.dart';
import 'chat/presentation/views/chat_doctor.dart';

class HomeDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getallappointments(),
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
                                  Text(
                                      'Dr.${patient_model!.data!.firstName} ${patient_model!.data!.lastName}',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.grey[400],
                                backgroundImage: patient_model!.data!.image !=
                                        null
                                    ? NetworkImage(
                                        "${imagebase}${patient_model!.data!.image?.path}")
                                    : NetworkImage(
                                        "https://cdn-icons-png.freepik.com/512/8459/8459373.png"),
                                radius: 25.0,
                              )
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
                              'https://assets9.lottiefiles.com/private_files/lf30_4FGi6N.json'),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width: 180.0,
                                        height: 160.0,
                                        child: Lottie.network(
                                            'https://assets6.lottiefiles.com/packages/lf20_fxvz0c.json')),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'All appointments booked.',
                                            style: TextStyle(
                                                color: HexColor('32313a'),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'All appointments that you have to complete.',
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
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          new_appointment()));
                                            },
                                            color: HexColor('ffe0f4'),
                                            child: Text(
                                              'Show!',
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
                              Container(
                                decoration: BoxDecoration(
                                  color: HexColor('ffe0f4'),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width: 180.0,
                                        height: 160.0,
                                        child: Lottie.network(
                                            'https://assets6.lottiefiles.com/private_files/lf30_BP4Us7.json')),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Done appointments.',
                                            style: TextStyle(
                                                color: HexColor('32313a'),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'All appointments completed successfully.',
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
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          done_appointment()));
                                            },
                                            color: HexColor('8a86e2'),
                                            child: Text(
                                              'Show!',
                                              style: TextStyle(
                                                  color: HexColor('ffe0f4'),
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
                              Container(
                                decoration: BoxDecoration(
                                  color: HexColor('8a86e2'),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        'asset/icon/archive.png',
                                        height: 140,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Canceled appointments.',
                                            style: TextStyle(
                                                color: HexColor('32313a'),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'Appointments canceled before they are finished',
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
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          cancel_appointment()));
                                            },
                                            color: HexColor('ffe0f4'),
                                            child: Text(
                                              'Show!',
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
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: HexColor('8a86e2'),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width: 180.0,
                                        height: 160.0,
                                        child: Lottie.network(
                                            'https://assets6.lottiefiles.com/packages/lf20_fxvz0c.json')),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'All appointments booked.',
                                            style: TextStyle(
                                                color: HexColor('32313a'),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'All appointments that you have to complete.',
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
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ChatDoctorScreen()));
                                            },
                                            color: HexColor('ffe0f4'),
                                            child: Text(
                                              'Show!',
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
                            ],
                          ),
                        ),
                        //الدكاترة عنوان
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
