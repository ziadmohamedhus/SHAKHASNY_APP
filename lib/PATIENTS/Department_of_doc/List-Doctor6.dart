import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/MANAGER/Add_doctors/Data/all_doctor_model.dart';
import 'package:hospital/constant.dart';

import '../../MANAGER/profile_doctor.dart';

class All_doctor extends StatelessWidget {
  final All_Doctor_Model model;

  All_doctor({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building All_doctor widget...');
    print('model.data length: ${model.data?.length ?? 0}');

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
                      Text(
                        'DOCTORS,',
                        style: TextStyle(
                          color: HexColor('32313a'),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Top Rated',
                        style: TextStyle(
                          color: HexColor('32313a'),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    backgroundImage: AssetImage("asset/image/1.jpg"),
                    radius: 25.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // Check if model.data is not null and has elements
            if (model.data != null && model.data!.isNotEmpty)
              for (int i = 0; i < model.data!.length; i++)
                InkWell(
                  onTap: () {
                    print(
                        'Tapped on doctor: ${model.data![i].firstName} ${model.data![i].lastName}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          doc: model.data![i],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: HexColor('8a86e2'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.black,
                    elevation: 30.0,
                    child: ListTile(
                      title: Text(
                        'Dr:${model.data![i].firstName} ${model.data![i].lastName}',
                        style: TextStyle(
                          color: HexColor('32313a'),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '${model.data![i].doctor!.specialization}',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[400],
                            backgroundImage: model.data![i].image != null
                                ? NetworkImage(
                                    "${imagebase}${model.data![i].image!.path}")
                                : NetworkImage("${copyimage}"),
                            radius: 25.0,
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.more_horiz_outlined),
                    ),
                  ),
                )
            else
              Center(
                child: Text(
                  'No doctors available',
                  style: TextStyle(
                    color: HexColor('32313a'),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
