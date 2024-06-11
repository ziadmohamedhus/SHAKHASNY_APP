
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class View_patient_Manager extends StatelessWidget {

  late Map map;
  View_patient_Manager(Map m)
  {
    map=m;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            //الشريط الاعلي
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Doctor profile,',style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Icon(Icons.format_list_bulleted_outlined,size: 35.0,)
                ],
              ),
            ),
            SizedBox(height: 35,),
            Hero(
              tag: 'name',
              child: CircleAvatar(
                backgroundColor: Colors.grey[400],
                backgroundImage: AssetImage('asset/image/login.jpeg',),
                radius: 75.0,
              ),
            ),
            SizedBox(height: 20,),
            Text('Patient Name : ${map['name']} ',style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 10,),
            Text('Phone : ${map['phone']}',style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 10,),
            Text('Country : ${map['country']}',style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 10,),
            Text('Date is : ${map['date']}',style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 10,),
            Text('Time : ${map['time']} ',style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
