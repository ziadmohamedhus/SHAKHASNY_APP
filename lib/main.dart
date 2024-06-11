import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/PATIENTS/Chat-with-doctor.dart';
import 'package:hospital/PATIENTS/Pharmacy.dart';

import 'MANAGER/Home-M.dart';
import 'MANAGER/Register_manager.dart';
import 'START/Animation.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor:Colors.deepPurple[500],titleTextStyle: TextStyle(color: Colors.white,fontSize: 24) ),
          fontFamily: 'Inter',
          scaffoldBackgroundColor:HexColor('fcfeff'),
          primarySwatch: Colors.deepPurple,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor('ffe0f4'),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: HexColor('32313a'),fontSize: 25.0,fontWeight: FontWeight.bold,),
            bodyMedium: TextStyle(color: HexColor('32313a'),fontSize: 15.0,fontWeight: FontWeight.bold),
          )
      ),
      darkTheme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor:HexColor('3A3B3C'),
          primarySwatch: Colors.deepPurple,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor('ffe0f4'),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: HexColor('fcfeff'),fontSize: 25.0,fontWeight: FontWeight.bold,),
            bodyMedium: TextStyle(color: HexColor('fcfeff'),fontSize: 15.0,fontWeight: FontWeight.bold),
          )
      ),
      themeMode: ThemeMode.light,
      home:Animation1(),
    );

  }

}

