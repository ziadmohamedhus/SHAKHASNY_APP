import 'package:flutter/material.dart';
import 'package:hospital/PATIENTS/Login/data/login_model.dart';

import 'MANAGER/Add_doctors/Data/all_doctor_model.dart';

String Kprimaryfont = "Inter";
Color Kprimarycolor = Colors.deepOrange;
dynamic? OnBoarding;
String? token;
Login_model? patient_model;
List<DataDoctor>? Cardiologistlist = [];
List<DataDoctor>? Neproistlist = [];
List<DataDoctor>? Ortholist = [];
List<DataDoctor>? Dentistlist = [];
List<DataDoctor>? eyeslist = [];
String imagebase = "https://abdelrahman.in/storage/";
String copyimage = "https://cdn-icons-png.freepik.com/512/8459/8459373.png";
