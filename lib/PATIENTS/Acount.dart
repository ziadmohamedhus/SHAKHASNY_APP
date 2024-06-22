import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constant.dart';

class Acount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
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
                        Text('Welcome,',
                            style: TextStyle(
                                color: HexColor('32313a'),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                            '${patient_model!.data!.firstName} ${patient_model!.data!.lastName}',
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
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('asset/image/1.jpg'),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: HexColor('ffe0f4'),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'User Name is : ${patient_model!.data!.firstName} ${patient_model!.data!.lastName}',
                    style: TextStyle(
                        fontSize: 19,
                        color: HexColor('32313a'),
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: HexColor('ffe0f4'),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'User Email is : ${patient_model!.data!.email} ',
                    style: TextStyle(
                        fontSize: 19,
                        color: HexColor('32313a'),
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: HexColor('ffe0f4'),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'User Phone is : ${patient_model!.data!.phone}',
                    style: TextStyle(
                        fontSize: 19,
                        color: HexColor('32313a'),
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: HexColor('ffe0f4'),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'User Country is : Egypt',
                    style: TextStyle(
                        fontSize: 19,
                        color: HexColor('32313a'),
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
