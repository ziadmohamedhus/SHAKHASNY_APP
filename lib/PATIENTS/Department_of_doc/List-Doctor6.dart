
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class All_doctor extends StatelessWidget {

  List All_doctor_data=[
    {
      'name':'DR.Ahmed Mohamed',
      'specialty':'Nephrologist',
      'years':'5 years experience',
      'money':5000,
      'image':'asset/image/2.jpg',
      'rate':4.5
    },
    {
      'name':'DR.Sara Hussein',
      'specialty':'Ophthalmologist',
      'years':'3 years experience',
      'money':500,
      'image':'asset/image/29.jpg',
      'rate':4.8
    },
    {
      'name':'DR.Aya Samy',
      'specialty':'Orthopedic',
      'years':'8 years experience',
      'money':600,
      'image':'asset/image/22.jpg',
      'rate':3.5
    },
    {
      'name':'DR.Eman Mohamed',
      'specialty':'Cardiologist',
      'years':'13 years experience',
      'money':500,
      'image':'asset/image/18.jpg',
      'rate':3.9
    },
    {
      'name':'DR.Naglaa Khaled',
      'specialty':'Nephrologist',
      'years':'9 years experience',
      'money':200,
      'image':'asset/image/23.jpg',
      'rate':2.7
    },
    {
      'name':'DR.Wafaa Mohamed',
      'specialty':'Dentist',
      'years':'5 years experience',
      'money':500,
      'image':'asset/image/4.jpg',
      'rate':3.6
    },
    {
      'name':'DR.Yousef Ezzat',
      'specialty':'Dentist',
      'years':'8 years experience',
      'money':600,
      'image':'asset/image/6.jpg',
      'rate':5.0
    },
    {
      'name':'DR.Assel Ziad',
      'specialty':'Orthopedic',
      'years':'7 years experience',
      'money':370,
      'image':'asset/image/14.jpg',
      'rate':2.1
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),

          child: ListView(
            children: [
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DOCTORS,',style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(height: 5.0,),
                        Text('Top Rated',style: Theme.of(context).textTheme.bodyLarge),
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
              SizedBox(height: 20.0,),
              for(int i=0;i<All_doctor_data.length;i++)
                Card(
                  color:  HexColor('8a86e2'),
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  shadowColor: Colors.black,
                  elevation: 30.0,
                  child: ListTile(
                    title:  Text('${All_doctor_data[i]['name']}',style: TextStyle(color:  HexColor('32313a'),fontSize: 20.0,fontWeight: FontWeight.w600,),) ,
                    subtitle: Text('${All_doctor_data[i]['years']}',style: TextStyle(color: Colors.grey[800],fontSize: 15.0,fontWeight: FontWeight.w500,),),
                    //الصورة في الاول
                    leading: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          backgroundImage: AssetImage(All_doctor_data[i]['image'],),
                          radius: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star,color: Colors.yellowAccent,size: 7,),

                                Text('9.7',style: TextStyle(color: Colors.black,fontSize: 10.0,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    //ايقونة في الاخر
                    trailing: Icon(Icons.more_horiz_outlined),

                  ),
                ),
            ],
          ),

        )
    );
  }
}
