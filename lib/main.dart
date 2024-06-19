import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/Api/api_service.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import 'START/Animation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Inter',
              scaffoldBackgroundColor: HexColor('fcfeff'),
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.deepPurple,
                  titleTextStyle:
                      TextStyle(color: HexColor('ffe0f4'), fontSize: 24)),
              primarySwatch: Colors.deepPurple,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('ffe0f4'),
              ),
              // textTheme: TextTheme(
              //   bodyLarge: TextStyle(
              //     color: HexColor('32313a'),
              //     fontSize: 25.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   bodyMedium: TextStyle(
              //       color: HexColor('32313a'),
              //       fontSize: 15.0,
              //       fontWeight: FontWeight.bold),
              // )
            ),
            darkTheme: ThemeData(
              fontFamily: 'Inter',
              scaffoldBackgroundColor: HexColor('3A3B3C'),
              primarySwatch: Colors.deepPurple,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('ffe0f4'),
              ),
            ),
            themeMode: ThemeMode.light,
            home: Animation1(),
          );
        },
      ),
    );
  }
}
