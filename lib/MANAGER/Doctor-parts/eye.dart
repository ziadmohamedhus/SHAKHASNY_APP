import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/MANAGER/profile_doctor.dart';

import '../../DATABASE/cubit.dart';
import '../../DATABASE/states.dart';
import '../../constant.dart';
import '../Home-M.dart';

class eye extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase_doctor(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Center(
          child: ConditionalBuilder(
            fallback: (context) => CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
            condition: eyeslist!.isNotEmpty,
            builder: (context) => ListView(
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
                          Text('Department of,',
                              style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Ophthalmologist',
                              style: TextStyle(
                                  color: HexColor('32313a'),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                for (int i = 0; i < eyeslist!.length; i++)
                  Dismissible(
                    key: Key("${eyeslist![i]!}"),
                    onDismissed: (direction) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeManager()));
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(color: Colors.purple),
                                      )),
                                ],
                                title: Text('Delete Doctor'),
                                contentPadding: EdgeInsets.all(20),
                                content: Text('This doctor has been removed'),
                              ));
                      AppCubit.get(context)
                          .Delete_Doctor(id: eyeslist![i].id.toString());
                    },
                    child: Card(
                      color: HexColor('8a86e2'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.black,
                      elevation: 30.0,
                      child: ListTile(
                        title: Text(
                          '${eyeslist![i].firstName!} ${eyeslist![i].lastName!}',
                          style: TextStyle(
                            color: HexColor('32313a'),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'Phone ${eyeslist![i].phone!}',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        //الصورة في الاول
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          backgroundImage: eyeslist![i].image != null
                              ? NetworkImage(
                                  "${imagebase}${eyeslist![i].image!.path}")
                              : NetworkImage(
                                  "https://cdn-icons-png.freepik.com/512/8459/8459373.png"),
                          radius: 25.0,
                        ),
                        //ايقونة في الاخر
                        trailing: Icon(Icons.more_horiz_outlined),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => ProfileScreen(
                                    doc: eyeslist![i],
                                  )));
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
