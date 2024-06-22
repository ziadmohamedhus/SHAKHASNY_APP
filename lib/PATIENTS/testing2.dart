
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Api/api_service.dart';

class Testing_2 extends StatefulWidget {

  @override
  State<Testing_2> createState() => _TestingState();
}

class _TestingState extends State<Testing_2> {
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController hypertension = TextEditingController();
  TextEditingController heart_disease = TextEditingController();
  TextEditingController smoking_history = TextEditingController();
  TextEditingController bmi = TextEditingController();
  TextEditingController HbA1c_level = TextEditingController();
  TextEditingController blood_glucose_level = TextEditingController();



  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              SizedBox(height: 30,),
              //الشريط الاعلي
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('FILL OUT,',
                            style: TextStyle(
                                color: HexColor('32313a'),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('The test',
                            style: TextStyle(
                                color: HexColor('32313a'),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 35.0,
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: "0",
                    child: Text("Female"),
                  ),
                  DropdownMenuItem(
                    value: "1",
                    child: Text("Male"),
                  ),

                ], //Ophthalmologist
                onChanged: (value) {
                  gender.text = value.toString();
                  print(gender.text);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_snippet_outlined),
                  labelText: "gender",
                  hintText: "gender",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),


              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter age';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: age,
                decoration: InputDecoration(
                    labelText: 'age',
                    hintText: 'Enter age',
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),


              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: "0",
                    child: Text("LOW"),
                  ),
                  DropdownMenuItem(
                    value: "1",
                    child: Text("HIGH"),
                  ),

                ], //Ophthalmologist
                onChanged: (value) {
                  hypertension.text = value.toString();
                  print(hypertension.text);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_snippet_outlined),
                  labelText: "hypertension",
                  hintText: "hypertension",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),


              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: "0",
                    child: Text("NO"),
                  ),
                  DropdownMenuItem(
                    value: "1",
                    child: Text("YES"),
                  ),

                ], //Ophthalmologist
                onChanged: (value) {
                  heart_disease.text = value.toString();
                  print(heart_disease.text);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_snippet_outlined),
                  labelText: "heart disease",
                  hintText: "heart disease",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),


              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                items: [

                  DropdownMenuItem(
                    value: "1",
                    child: Text("Current"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("former"),
                  ),
                  DropdownMenuItem(
                    value: "4",
                    child: Text("Never"),
                  ),

                ], //Ophthalmologist
                onChanged: (value) {
                  smoking_history.text = value.toString();
                  print(smoking_history.text);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_snippet_outlined),
                  labelText: "smoking_history",
                  hintText: "smoking_history",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),



              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter bmi';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: bmi,
                decoration: InputDecoration(
                    labelText: 'bmi',
                    hintText: 'Enter bmi',
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter HbA1c_level';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: HbA1c_level,
                decoration: InputDecoration(
                    labelText: 'HbA1c_level',
                    hintText: 'Enter HbA1c_level',
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter blood_glucose_level';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: blood_glucose_level,
                decoration: InputDecoration(
                    labelText: 'blood_glucose_level',
                    hintText: 'Enter blood_glucose_level',
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),

              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  if (form_key.currentState!.validate()) {
                    callModel(age: age.text,blood_glucose_level: blood_glucose_level.text,bmi: bmi.text,gender: gender.text,HbA1c_level: HbA1c_level.text,heart_disease: heart_disease.text,hypertension: hypertension.text,smoking_history: smoking_history.text);
                  }
                },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

            ],),
          ),
        ),
      ),
    );
  }



  void callModel({
    required dynamic gender,
    required dynamic age,
    required dynamic hypertension,
    required dynamic heart_disease,
    required dynamic smoking_history,
    required dynamic bmi,
    required dynamic HbA1c_level,
    required dynamic blood_glucose_level,

  }) {

    DioHelper.postData(
      url: 'https://7637-41-46-11-49.ngrok-free.app/predict',
      data: {
        "gender": gender,
        "age": age,
        "hypertension": hypertension,
        "heart_disease": heart_disease,
        "smoking_history": smoking_history,
        "bmi": bmi,
        "HbA1c_level": HbA1c_level,
        "blood_glucose_level": blood_glucose_level,
      },
    ).then((value) {
      print(value.statusCode);
      print(value.statusMessage);
      print(value.data);

      print(value.data["prediction"]);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.purple),
                  )),
            ],
            title: Text('the result is'),
            contentPadding: EdgeInsets.all(20),
            content: Text('${value.data["prediction"]}'),
          ));

      setState(() {

      });
    }).catchError((error) {
      print("error $error");
      setState(() {});
    });
  }
}
