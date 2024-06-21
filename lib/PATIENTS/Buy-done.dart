import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constant.dart';
import 'Home-bage.dart';

class Buy_done extends StatelessWidget {
  final String name;
  final double money;
  final int number;

  const Buy_done(
      {Key? key, required this.name, required this.money, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text('Thank you,',
                            style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('Buying succeeded',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Icon(
                      Icons.format_list_bulleted_outlined,
                      size: 35.0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Image.asset(
                'asset/icon/10.png',
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Name : ${patient_model!.data!.firstName} ${patient_model!.data!.lastName}',
                style: TextStyle(
                    color: HexColor('8a86e2'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Phone :  ${patient_model!.data!.phone}',
                style: TextStyle(
                    color: Colors.pink[200],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Medicine Name : $name',
                style: TextStyle(
                    color: HexColor('8a86e2'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Number Of Product:  $number',
                style: TextStyle(
                    color: Colors.pink[200],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 30,
              ),
              Text(
                'Total Bill:  $money',
                style: TextStyle(
                    color: Colors.pink[200],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                color: Colors.pink[200],
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Home_bage()));
                  },
                  child: Text(
                    'HOME',
                    style: TextStyle(
                        color: HexColor('8a86e2'),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
