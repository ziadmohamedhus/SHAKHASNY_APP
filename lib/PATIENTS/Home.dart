import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../START/Animation.dart';
import '../constant.dart';
import 'About-us.dart';
import 'Acount.dart';
import 'BMI/BMI.dart';
import 'Chat_bot.dart';
import 'Department_of_doc/List-Doctor1.dart';
import 'Department_of_doc/List-Doctor2.dart';
import 'Department_of_doc/List-Doctor3.dart';
import 'Department_of_doc/List-Doctor4.dart';
import 'Department_of_doc/List-Doctor5.dart';
import 'Department_of_doc/List-Doctor6.dart';
import 'Facebook.dart';
import 'Pharmacy.dart';
import 'Youtube.dart';
import 'all_appointment/views/all_appointment.dart';

class Home extends StatelessWidget {
  List<Widget> addvertsment_images = [
    const Image(
      image: AssetImage('asset/image/n1.webp'),
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    const Image(
      image: AssetImage('asset/image/n2.webp'),
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    const Image(
      image: AssetImage('asset/image/n3.webp'),
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    const Image(
      image: AssetImage('asset/image/n4.webp'),
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  ];
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocProvider(
      create: (context) => AppCubit()
        ..getalldoctor()
        ..Getappopatient(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text('SHAKHSNI',
                style: TextStyle(
                    color: HexColor('ffe0f4'), fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: Container(
              color: HexColor('ffe0f4'),
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                        '${patient_model!.data!.firstName} ${patient_model!.data!.lastName}'),
                    accountEmail: Text('${patient_model!.data!.email}'),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage('asset/image/1.jpg'),
                    ),
                  ),
                  Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text(
                        'About US',
                        style: TextStyle(
                            color: HexColor('32313a'),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.book),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AboutAs()));
                      },
                    ),
                  ),
                  Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text('My Acount',
                          style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.account_circle),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Acount()));
                      },
                    ),
                  ),
                  Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text('Logout',
                          style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.login),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Animation1()));
                      },
                    ),
                  ),
                  Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text('Pharmacy',
                          style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.local_hospital),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Pharmacy()));
                      },
                    ),
                  ),
                  Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text('YouTube channel',
                          style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.ondemand_video_outlined),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => youtube()));
                      },
                    ),
                  ),
                  Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text('Facebook page',
                          style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.facebook_outlined),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => facebook()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
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
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                                '${patient_model!.data!.firstName} ${patient_model!.data!.lastName}',
                                style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          backgroundImage:
                              const AssetImage('asset/image/1.jpg'),
                          radius: 25.0,
                        )
                      ],
                    ),
                  ),
                  //السيرش
                  const SizedBox(
                    height: 20.0,
                  ),
                  ////////////////////////////
                  ////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                        items: addvertsment_images,
                        options: CarouselOptions(
                            height: 200,
                            enableInfiniteScroll: true,
                            initialPage: 0,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ///////////////////////////////////////////
                  //////////////////
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'How can we help you ..',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                              Image.asset(
                                'asset/icon/1.png',
                                height: 160,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Booking dates',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Know the status of your order',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            (context),
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AppointmentStatus()));
                                      },
                                      color: HexColor('ffe0f4'),
                                      child: Text(
                                        'GO to Know!',
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: HexColor('ffe0f4'),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'asset/icon/2.png',
                                height: 160,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Calculate Your BMI:',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'fill the form now!!',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => BMI()));
                                      },
                                      color: HexColor('8a86e2'),
                                      child: Text(
                                        'GET STARTED!',
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
                      ],
                    ),
                  ),
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
                              Image.asset(
                                'asset/icon/ai.png',
                                height: 160,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Healthcare AI chat bot.',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'ZYS is a modern robot for diagnosing diseases..',
                                      style: TextStyle(
                                          color: HexColor('32313a'),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            (context),
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Chat_bot()));
                                      },
                                      color: HexColor('ffe0f4'),
                                      child: Text(
                                        'Join us now!',
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
                  //تخصصات
                  Container(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              print(all_doctor_model!.data![0].firstName);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Dentist()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent[100]!
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'asset/icon/4.png',
                                    height: 45,
                                  ),
                                  Text(
                                    'Dentist',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              print(all_doctor_model);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Cardiologist()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent[100]!
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'asset/icon/5.png',
                                    height: 45,
                                  ),
                                  Text(
                                    'CARDIOLOGIST',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Orthopedic()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent[100]!
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'asset/icon/6.png',
                                    height: 45,
                                  ),
                                  Text(
                                    'ORTHOPEDIC',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Nephrologist()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent[100]!
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'asset/icon/7.png',
                                    height: 45,
                                  ),
                                  Text(
                                    'NEPHROLOGIST',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Ophthalmologist()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent[100]!
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'asset/icon/8.png',
                                    height: 45,
                                  ),
                                  Text(
                                    'OPHTHALMOLOGIST',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // الدكاترة العنوان
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Top Doctors',
                                style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  AppCubit.get(context).getalldoctor();
                                  Navigator.of(context).push(MaterialPageRoute(
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
                                color: Colors.pinkAccent[100]!.withOpacity(0.2),
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
                                        backgroundImage:
                                            AssetImage('asset/image/2.jpg'),
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
                                color: Colors.pinkAccent[100]!.withOpacity(0.2),
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
                                        backgroundImage:
                                            AssetImage('asset/image/3.jpg'),
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
      ),
    );
  }
}
