import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/DATABASE/states.dart';
import 'package:hospital/constant.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

import '../Api/api_service.dart';
import '../DOCTOR/Models/appointments_model.dart';
import '../MANAGER/Add_doctors/Data/all_doctor_model.dart';
import '../PATIENTS/Acount.dart';
import '../PATIENTS/Home.dart';
import '../PATIENTS/Pharmacy.dart';
import '../PATIENTS/all_appointment/data/appointment_model.dart';
import '../components.dart';
import '../pharmacy/data/accounts_model.dart';
import '../pharmacy/data/pharmacy_model.dart';
import '../pharmacy/data/solid_medicine_model.dart';
import '../work_hour/data/timedoctor.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int current_index = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.medication_sharp), label: 'Pharmacy'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Acount'),
  ];
  List<Widget> screans = [
    Home(),
    Pharmacy(),
    Acount(),
  ];

  void changebottomnav(int index) {
    current_index = index;
    emit(bottomnav_state());
  }

  bool textt = true;
  IconData ic = Icons.remove_red_eye;
  late Database database;

  void createDatabase() {
    openDatabase(
      'patients.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE patient (id INTEGER PRIMARY KEY, first TEXT, second TEXT, email TEXT, password TEXT , phone TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String first,
    required String second,
    required String email,
    required String password,
    required String phone,
  }) async {
    database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO patient(first, second, email, password, phone) VALUES("$first", "$second", "$email", "$password" , "$phone")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  void getDataFromDatabase(database) {
    //patientlist = [];
    database.rawQuery('SELECT * FROM patient').then((value) {
      patientlist = value;
      print(patientlist);
      print(patientlist.length);
      emit(AppGetDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM patient WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void updateData({
    required String fname,
    required String lname,
    required String email,
    required String phone,
    required int id,
  }) async {
    database.rawUpdate(
      'UPDATE patient SET first = ?, second = ?, email = ?, phone = ? WHERE id = ?',
      ['$fname', '$lname', '$email', '$phone', id],
    ).then((value) {
      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);
    });
  }

  void obsecuree() {
    textt = !textt;
    textt ? ic = Icons.visibility : ic = Icons.visibility_off;
    emit(Text_Obsecure_State());
  }

  late Database database_doctor;

  void createDatabase_doctor() {
    openDatabase(
      'doctors.db',
      version: 1,
      onCreate: (database_doctor, version) {
        print('database created');
        database_doctor
            .execute(
                'CREATE TABLE doctor (id INTEGER PRIMARY KEY, first TEXT, second TEXT, email TEXT, password TEXT , phone TEXT , specification TEXT , experience TEXT , image TEXT )')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database_doctor) {
        getDataFromDatabase_doctor(database_doctor);
        print('database opened');
      },
    ).then((value) {
      database_doctor = value;
      emit(AppCreateDatabaseState_doctor());
    });
  }

  insertToDatabase_doctor({
    required String first,
    required String second,
    required String email,
    required String password,
    required String phone,
    required String specific,
    required String experience,
    required String image,
  }) async {
    database_doctor.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO doctor(first, second, email, password, phone ,specification ,experience ,image) VALUES("$first", "$second", "$email", "$password" , "$phone","$specific","$experience","$image")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState_doctor());
        getDataFromDatabase_doctor(database_doctor);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  void getDataFromDatabase_doctor(database_doctor) {
    //patientlist = [];
    doctorlist_Dentist = [];
    doctorlist_Cardiolo = [];
    doctorlist_Orthopedi = [];
    doctorlist_Nephrologist = [];
    doctorlist_Ophthalmologist = [];
    database_doctor.rawQuery('SELECT * FROM doctor').then((value) {
      value.forEach((element) {
        if (element["specification"] == "dentist")
          doctorlist_Dentist.add(element);
        else if (element["specification"] == "cardiologist")
          doctorlist_Cardiolo.add(element);
        else if (element["specification"] == "orthopedic")
          doctorlist_Orthopedi.add(element);
        else if (element["specification"] == "nephrologist")
          doctorlist_Nephrologist.add(element);
        else
          doctorlist_Ophthalmologist.add(element);
      });
      print(value);
      print(value.length);
      emit(AppGetDatabaseState_doctor());
    });
  }

  void deleteData_doctor({
    required int id,
  }) async {
    database_doctor
        .rawDelete('DELETE FROM doctor WHERE id = ?', [id]).then((value) {
      getDataFromDatabase_doctor(database_doctor);
      emit(AppDeleteDatabaseState_doctor());
    });
  }

  //////////////////////////////////////////////////////////////////////////////
  late Database database_Appo;

  void createDatabase_Appo() {
    openDatabase(
      'appointmentsssssss.db',
      version: 1,
      onCreate: (database_Appo, version) {
        print('database created');
        database_Appo
            .execute(
                'CREATE TABLE appointment (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, doctor TEXT, date TEXT , time TEXT , country TEXT , status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database_Appo) {
        getDataFromDatabase_Appo(database_Appo);
        print('database opened');
      },
    ).then((value) {
      database_Appo = value;
      emit(AppCreateDatabaseState_App());
    });
  }

  insertToDatabase_Appo({
    required String name,
    required String phone,
    required String doctor,
    required String date,
    required String time,
    required String country,
  }) async {
    database_Appo.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO appointment(name, phone ,doctor ,date ,time,country ,status) VALUES("$name", "$phone", "$doctor", "$date" , "$time","$country" ,"new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState_App());
        getDataFromDatabase_Appo(database_Appo);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  void getDataFromDatabase_Appo(database_Appo) {
    Appointement_list = [];
    new_Appointement_list = [];
    done_Appointement_list = [];
    cancel_Appointement_list = [];
    database_Appo.rawQuery('SELECT * FROM appointment').then((value) {
      value.forEach((element) {
        if (element["status"] == "new") {
          Appointement_list.add(element);
          new_Appointement_list.add(element);
        } else if (element["status"] == "done") {
          Appointement_list.add(element);
          done_Appointement_list.add(element);
        } else {
          Appointement_list.add(element);
          cancel_Appointement_list.add(element);
        }
      });
      print(value);
      print(value.length);
      emit(AppGetDatabaseState_App());
    });
  }

  void deleteData_Appo({
    required int id,
  }) async {
    database_Appo
        .rawDelete('DELETE FROM appointment WHERE id = ?', [id]).then((value) {
      getDataFromDatabase_Appo(database_Appo);
      emit(AppInsertDatabaseState_App());
    });
  }

  void updateData_Appo({
    required String status,
    required int id,
  }) async {
    database_Appo.rawUpdate(
      'UPDATE appointment SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      emit(AppUpdateDatabaseState_App());
      getDataFromDatabase_Appo(database_Appo);
    });
  }

  //==============================================

  // void Add_doctor(
  //     {required String email,
  //     required String password,
  //     required String password_confirmation,
  //     required String phone,
  //     required String first_name,
  //     required String last_name,
  //     required String birth_date,
  //     required String specialization,
  //     required String fees,
  //     required String image}) {
  //   emit(AddDoctorLoadingState());
  //   DioHelper.postData(
  //     url: 'https://abdelrahman.in/api/doctor/store',
  //     data: {
  //       'first_name': first_name,
  //       'last_name': last_name,
  //       'email': email,
  //       'password': password,
  //       'password_confirmation': password_confirmation,
  //       'phone': phone,
  //       'birth_date': birth_date,
  //       'specialization': specialization,
  //       'department_id': "1",
  //       "fee": fees,
  //       "image": image,
  //     },
  //     token: token,
  //   ).then((value) {
  //     if (value.statusCode! >= 200 && value.statusCode! < 300) {
  //       print(value.data["message"]);
  //       getalldoctor();
  //       emit(AddDoctorSuccessState(message: value.data["message"]));
  //     } else {
  //       if (value.statusCode == 401) {
  //         emit(AddDoctorFauilreState(error: value.data["message"]));
  //         print(value.data["message"]);
  //         print(value.data);
  //       } else {
  //         emit(AddDoctorFauilreState(error: value.data["message"]));
  //         print(value.data["message"]);
  //         print(value.data);
  //       }
  //     }
  //   }).catchError((error) {
  //     //log(error.toString());
  //     emit(AddDoctorFauilreState(error: error));
  //   });
  // }

  void getalldoctor() async {
    emit(GetAllDoctorLoadingState());
    await DioHelper.getData(
      url: 'https://abdelrahman.in/api/doctors',
      token: token,
    ).then((value) {
      print(value.data["success"]);
      print(value.data);
      print("sucess  token:${token}");
      all_doctor_model = All_Doctor_Model.fromJson(value.data);
      Cardiologistlist = [];
      Neproistlist = [];
      Ortholist = [];
      Dentistlist = [];
      eyeslist = [];
      for (int i = 0; i < all_doctor_model!.data!.length; i++) {
        if (all_doctor_model!.data![i].doctor!.specialization == "dentist") {
          Dentistlist!.add(all_doctor_model!.data![i]);
        } else if (all_doctor_model!.data![i].doctor!.specialization ==
            "cardiologist") {
          Cardiologistlist!.add(all_doctor_model!.data![i]);
        } else if (all_doctor_model!.data![i].doctor!.specialization ==
            "orthopedic") {
          Ortholist!.add(all_doctor_model!.data![i]);
        } else if (all_doctor_model!.data![i].doctor!.specialization ==
            "nephrologist") {
          Neproistlist!.add(all_doctor_model!.data![i]);
        } else if (all_doctor_model!.data![i].doctor!.specialization ==
            "ophthalmologist") {
          eyeslist!.add(all_doctor_model!.data![i]);
        }
      }
      emit(GetAllDoctorSuccessState());
    }).catchError((error) {
      print(error);
      print("fal  token:${token}");
      emit(GetAllDoctorFauilreState(error: error.toString()));
    });
  }

  String? image;
  final ImagePicker picker = ImagePicker();
  void openGallery(BuildContext context) async {
    try {
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        File imageFile = File(pickedImage.path);
        image = pickedImage.path;
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void ADD_Doctor({
    required String email,
    required String password,
    required String password_confirmation,
    required String phone,
    required String first_name,
    required String last_name,
    required String birth_date,
    required String specialization,
    required String fees,
  }) async {
    emit(AddDoctorLoadingState());
    print(image);
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'lang': "en",
        'Authorization': token ?? '',
      };

      Map<String, String> map = {
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
        'phone': phone,
        'birth_date': birth_date,
        'specialization': specialization,
        'department_id': "1",
        "fee": fees,
      };

      Uri uri = Uri.parse("https://abdelrahman.in/api/doctor/store");
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(map);

      if (image != null && image!.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', image!));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Response body: ${response.body}'); // Print the raw response body
      print('Response status: ${response.statusCode}'); // Print the status code

      var result;
      try {
        result = jsonDecode(response.body);
      } catch (e) {
        throw FormatException('Failed to decode JSON response');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(result["message"]);
        getalldoctor();
        emit(AddDoctorSuccessState(message: result["message"]));
      } else {
        emit(AddDoctorFauilreState(error: result["message"]));
        print(result["message"]);
        print(result);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(AddDoctorFauilreState(error: e.toString()));
    }
  }

  void workhourdoctor({
    required String day,
    required String id,
    required String start_date,
    required String end_date,
  }) {
    emit(GetworkDoctorLoadingState());
    DioHelper.postData(
            url: 'https://abdelrahman.in/api/doctor/working/hours/${id}',
            data: {
              'day_name': day,
              'start_time': start_date,
              'end_time': end_date,
            },
            token: token)
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        getalldoctor();
        emit(GetworkDoctorSuccessState(message: value.data["message"]));
      } else {
        if (value.statusCode == 401) {
          emit(GetworkDoctorFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(GetworkDoctorFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      log(error.toString());
      emit(GetworkDoctorFauilreState(error: error));
    });
  }

  void deletedoctor({
    required String id,
  }) {
    emit(DeleteDoctorLoadingState());
    DioHelper.postData(
      url: 'https://abdelrahman.in/api/doctor/destroy/"${id}',
      data: {},
      token: token,
    ).then((value) {
      print("value ${value.data}");
      print("status ${value.statusCode}");
      emit(DeleteDoctorSuccessState(message: value.data['message']));
    }).catchError((error) {
      print("error $error");
      emit(DeleteDoctorFauilreState(error: error.toString()));
    });
  }

  void MakeAppointment({
    required String doctor_id,
    required String date,
    required String time,
    required String reason,
  }) {
    emit(MakeAppointmentLoadingState());
    DioHelper.postData(
            url: 'https://abdelrahman.in/api/appointments',
            data: {
              'doctor_id': doctor_id,
              'day_name': date,
              'time': time,
              'reason': reason,
            },
            token: token)
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        emit(MakeAppointmentSuccessState(message: value.data["message"]));
      } else {
        if (value.statusCode == 401) {
          emit(MakeAppointmentFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(MakeAppointmentFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      log(error.toString());
      emit(GetworkDoctorFauilreState(error: error));
    });
  }

  Time_Doc? time_doc;

  void gettimedoctor({required String id, required String day}) async {
    emit(GettimedoctorLoadingState());
    await DioHelper.getData(
      url: 'https://abdelrahman.in/api/available-slots/${id}?day_name=${day}',
      token: token,
    ).then((value) {
      print(value.data);
      time_doc = Time_Doc.fromJson(value.data);
      print(time_doc!.data!.length);
      emit(GettimedoctorSuccessState());
    }).catchError((error) {
      emit(GettimedoctorFauilreState(error: error.toString()));
    });
  }

  patient_info_model? patientinfo;
  void Getappopatient() async {
    emit(GetAppPatientLoadingState());
    await DioHelper.getData(
      url: 'https://abdelrahman.in/api/appointments',
      token: token,
    ).then((value) {
      print(value.data);
      patientinfo = patient_info_model.fromJson(value.data);
      print(patientinfo!.data!.length);
      emit(GetAppPatientSuccessState());
    }).catchError((error) {
      emit(GetAppPatientFauilreState(error: error.toString()));
    });
  }

  void PayMoney({
    required String card_name,
    required String card_number,
    required String exp_month,
    required String exp_year,
    required String id,
    required String cvc,
  }) {
    emit(BuyMoneyLoadingState());
    DioHelper.postData(
            url: 'https://abdelrahman.in/api/appointments/${id}/pay',
            data: {
              'card_name': card_name,
              'card_number': card_number,
              'exp_month': exp_month,
              'exp_year': exp_year,
              'cvc': cvc,
            },
            token: token)
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        emit(BuyMoneySuccessState(message: value.data["message"]));
      } else {
        if (value.statusCode == 401) {
          emit(BuyMoneyFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(BuyMoneyFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      log(error.toString());
      emit(BuyMoneyFauilreState(error: error));
    });
  }

  All_appointments_doctor_model? all_appointments_doctor_model;
  List<Date_appointment> new_appointments = [];
  List<Date_appointment> accept_appointments = [];
  List<Date_appointment> reject_appointments = [];

  void getallappointments() async {
    emit(AppointmentsDoctorLoadingState());
    await DioHelper.getData(
      url: 'https://abdelrahman.in/api/doctor/appointments',
      token: token,
    ).then((value) {
      print(value.data["success"]);
      print(value.data);
      print("sucess  token:${token}");
      all_appointments_doctor_model =
          All_appointments_doctor_model.fromJson(value.data);

      new_appointments = [];
      accept_appointments = [];
      reject_appointments = [];

      for (int i = 0; i < all_appointments_doctor_model!.data!.length; i++) {
        if (all_appointments_doctor_model!.data![i].status == "rejected") {
          reject_appointments!.add(all_appointments_doctor_model!.data![i]);
        } else if (all_appointments_doctor_model!.data![i].status ==
            "accepted") {
          accept_appointments!.add(all_appointments_doctor_model!.data![i]);
        } else if (all_appointments_doctor_model!.data![i].status ==
            "pending") {
          new_appointments!.add(all_appointments_doctor_model!.data![i]);
        }
      }
      print(new_appointments.length);
      emit(AppointmentsDoctorSuccessState(message: value.data["message"]));
    }).catchError((error) {
      print(error);
      print("fal  token:${token}");
      emit(AppointmentsDoctorFauilreState(error: error.toString()));
    });
  }

  void accept_appointment({
    required String id,
  }) {
    emit(AcceptAppointmentsDoctorLoadingState());
    DioHelper.postData(
      url: 'https://abdelrahman.in/api/doctor/appointments/${id}/accept',
      data: {"_method": "PUT"},
      token: token,
    ).then((value) {
      print("value ${value.data}");
      print("status ${value.statusCode}");

      emit(
          AcceptAppointmentsDoctorSuccessState(message: value.data['message']));
      getallappointments();
    }).catchError((error) {
      print("error $error");
      emit(AcceptAppointmentsDoctorFauilreState(error: error.toString()));
    });
  }

  void reject_appointment({
    required String id,
  }) {
    emit(RejectAppointmentsDoctorLoadingState());
    DioHelper.postData(
      url: 'https://abdelrahman.in/api/doctor/appointments/${id}/reject',
      data: {"_method": "PUT"},
      token: token,
    ).then((value) {
      print("value ${value.data}");
      print("status ${value.statusCode}");

      emit(
          RejectAppointmentsDoctorSuccessState(message: value.data['message']));
      getallappointments();
    }).catchError((error) {
      print("error $error");
      emit(RejectAppointmentsDoctorFauilreState(error: error.toString()));
    });
  }

  Pharmacy_Model? pharmacy_model;
  void GetMedicines() async {
    emit(GetMedicinesLoadingState());
    await DioHelper.getData(
      url: 'https://abdelrahman.in/api/medicines',
      token: token,
    ).then((value) {
      print(value.data);
      pharmacy_model = Pharmacy_Model.fromJson(value.data);
      emit(GetMedicinesSuccessState());
    }).catchError((error) {
      emit(GetMedicinesFauilreState(error: error.toString()));
    });
  }

  void BuyMedicine({
    required String card_name,
    required String card_number,
    required String exp_month,
    required String exp_year,
    required String id,
    required String cvc,
    required String quantity,
  }) {
    emit(BuyMoneyLoadingState());
    DioHelper.postData(
            url: 'https://abdelrahman.in/api/medicines/${id}/pay',
            data: {
              'card_name': card_name,
              'card_number': card_number,
              'exp_month': exp_month,
              'exp_year': exp_year,
              'cvc': cvc,
              'quantity': quantity,
            },
            token: token)
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        emit(BuyMoneySuccessState(message: value.data["message"]));
      } else {
        if (value.statusCode == 401) {
          emit(BuyMoneyFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(BuyMoneyFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      log(error.toString());
      emit(BuyMoneyFauilreState(error: error));
    });
  }

  Solid_Medicine_Model? solid_medicine_model;
  void GetSolidMedicines() async {
    emit(GetMedicinesLoadingState());
    await DioHelper.getData(
      url: 'https://abdelrahman.in/api/medicine-payments/patient',
      token: token,
    ).then((value) {
      print(value.data);
      solid_medicine_model = Solid_Medicine_Model.fromJson(value.data);
      emit(GetMedicinesSuccessState());
    }).catchError((error) {
      emit(GetMedicinesFauilreState(error: error.toString()));
    });
  }

  void ADD_Medicines({
    required String name,
    required String price,
    required String quantity,
    required String expiry_date,
  }) async {
    emit(AddDoctorLoadingState());
    print(image);
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'lang': "en",
        'Authorization': token ?? '',
      };

      Map<String, String> map = {
        'name': name,
        'price': price,
        'quantity': quantity,
        'expiry_date': expiry_date,
      };

      Uri uri = Uri.parse("https://abdelrahman.in/api/medicines");
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(map);

      if (image != null && image!.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', image!));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Response body: ${response.body}'); // Print the raw response body
      print('Response status: ${response.statusCode}'); // Print the status code

      var result;
      try {
        result = jsonDecode(response.body);
      } catch (e) {
        throw FormatException('Failed to decode JSON response');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(result["message"]);
        getalldoctor();
        emit(AddDoctorSuccessState(message: result["message"]));
      } else {
        emit(AddDoctorFauilreState(error: result["message"]));
        print(result["message"]);
        print(result);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(AddDoctorFauilreState(error: e.toString()));
    }
  }

  Accounts_Model? accounts_model;
  void GetAccoutantsMedicines() async {
    emit(GetMedicinesLoadingState());
    await DioHelper.getData(
      url: 'https://abdelrahman.in/api/medicine-payments',
      token: token,
    ).then((value) {
      print(value.data);
      accounts_model = Accounts_Model.fromJson(value.data);
      emit(GetMedicinesSuccessState());
    }).catchError((error) {
      emit(GetMedicinesFauilreState(error: error.toString()));
    });
  }

  void Update_Medicines({
    required String name,
    required String price,
    required String quantity,
    required String expiry_date,
    required String id,
  }) async {
    emit(AddDoctorLoadingState());
    print(image);
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'lang': "en",
        'Authorization': token ?? '',
      };

      Map<String, String> map = {
        'name': name,
        'price': price,
        'quantity': quantity,
        'expiry_date': expiry_date,
        "_method": "PUT"
      };

      Uri uri = Uri.parse("https://abdelrahman.in/api/medicines/${id}");
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(map);

      if (image != null && image!.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', image!));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Response body: ${response.body}'); // Print the raw response body
      print('Response status: ${response.statusCode}'); // Print the status code

      var result;
      try {
        result = jsonDecode(response.body);
      } catch (e) {
        throw FormatException('Failed to decode JSON response');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(result["message"]);
        getalldoctor();
        emit(AddDoctorSuccessState(message: result["message"]));
      } else {
        emit(AddDoctorFauilreState(error: result["message"]));
        print(result["message"]);
        print(result);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(AddDoctorFauilreState(error: e.toString()));
    }
  }

  void Delete_Medicines({
    required String id,
  }) async {
    emit(AddDoctorLoadingState());
    print(image);
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'lang': "en",
        'Authorization': token ?? '',
      };

      Map<String, String> map = {};

      Uri uri = Uri.parse("https://abdelrahman.in/api/medicines/${id}");
      var request = http.MultipartRequest('DELETE', uri);
      request.headers.addAll(headers);
      request.fields.addAll(map);

      if (image != null && image!.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', image!));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Response body: ${response.body}'); // Print the raw response body
      print('Response status: ${response.statusCode}'); // Print the status code

      var result;
      try {
        result = jsonDecode(response.body);
      } catch (e) {
        throw FormatException('Failed to decode JSON response');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(result["message"]);
        getalldoctor();
        emit(AddDoctorSuccessState(message: result["message"]));
      } else {
        emit(AddDoctorFauilreState(error: result["message"]));
        print(result["message"]);
        print(result);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(AddDoctorFauilreState(error: e.toString()));
    }
  }
}
