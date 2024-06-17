import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/MANAGER/Add_doctors/Data/all_doctor_model.dart';

import '../../MANAGER/profile_doctor.dart';

class All_doctor extends StatelessWidget {
  final All_Doctor_Model model;
  List All_doctor_data = [
    {
      'name': 'DR.Ahmed Mohamed',
      'specialty': 'Nephrologist',
      'years': '5 years experience',
      'money': 5000,
      'image': 'asset/image/2.jpg',
      'rate': 4.5
    },
    {
      'name': 'DR.Sara Hussein',
      'specialty': 'Ophthalmologist',
      'years': '3 years experience',
      'money': 500,
      'image': 'asset/image/29.jpg',
      'rate': 4.8
    },
    {
      'name': 'DR.Aya Samy',
      'specialty': 'Orthopedic',
      'years': '8 years experience',
      'money': 600,
      'image': 'asset/image/22.jpg',
      'rate': 3.5
    },
    {
      'name': 'DR.Eman Mohamed',
      'specialty': 'Cardiologist',
      'years': '13 years experience',
      'money': 500,
      'image': 'asset/image/18.jpg',
      'rate': 3.9
    },
    {
      'name': 'DR.Naglaa Khaled',
      'specialty': 'Nephrologist',
      'years': '9 years experience',
      'money': 200,
      'image': 'asset/image/23.jpg',
      'rate': 2.7
    },
    {
      'name': 'DR.Wafaa Mohamed',
      'specialty': 'Dentist',
      'years': '5 years experience',
      'money': 500,
      'image': 'asset/image/4.jpg',
      'rate': 3.6
    },
    {
      'name': 'DR.Yousef Ezzat',
      'specialty': 'Dentist',
      'years': '8 years experience',
      'money': 600,
      'image': 'asset/image/6.jpg',
      'rate': 5.0
    },
    {
      'name': 'DR.Assel Ziad',
      'specialty': 'Orthopedic',
      'years': '7 years experience',
      'money': 370,
      'image': 'asset/image/14.jpg',
      'rate': 2.1
    },
  ];

  All_doctor({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                    Text('DOCTORS,',
                        style: TextStyle(
                            color: HexColor('32313a'),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('Top Rated',
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
          for (int i = 0; i < model.data!.length; i++)
            InkWell(
              onTap: () {
                print(model.data![i].workingHours);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              doc: model.data![i],
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
                    'Dr:${model!.data![i].firstName} ${model!.data![i].lastName}',
                    style: TextStyle(
                      color: HexColor('32313a'),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${model!.data![i].doctor!.specialization}',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //الصورة في الاول
                  leading: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        backgroundImage: AssetImage(
                          All_doctor_data[0]['image'],
                        ),
                        radius: 25.0,
                      ),
                    ],
                  ),
                  //ايقونة في الاخر
                  trailing: Icon(Icons.more_horiz_outlined),
                ),
              ),
            ),
        ],
      ),
    ));
  }
}
