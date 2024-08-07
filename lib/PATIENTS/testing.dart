
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Api/api_service.dart';

class Testing extends StatefulWidget {

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  TextEditingController rbc = TextEditingController();

  TextEditingController pcv = TextEditingController();

  TextEditingController mcv = TextEditingController();

  TextEditingController mch = TextEditingController();

  TextEditingController mchc = TextEditingController();

  TextEditingController rdw = TextEditingController();

  TextEditingController tlc = TextEditingController();

  TextEditingController plt = TextEditingController();

  TextEditingController hgb = TextEditingController();

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
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the data';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: rbc,
                decoration: InputDecoration(
                    labelText: 'RBC',
                    hintText: 'Enter RBC',
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
                    return 'please enter pcv';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: pcv,
                decoration: InputDecoration(
                    labelText: 'PCV',
                    hintText: 'Enter pcv',
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
                    return 'please enter mcv';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: mcv,
                decoration: InputDecoration(
                    labelText: 'MCV',
                    hintText: 'Enter mcv',
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
                    return 'please enter mch';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: mch,
                decoration: InputDecoration(
                    labelText: 'MCH',
                    hintText: 'Enter mch',
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
                    return 'please enter mchc';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: mchc,
                decoration: InputDecoration(
                    labelText: 'MCHC',
                    hintText: 'Enter mchc',
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
                    return 'please enter rdw';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: rdw,
                decoration: InputDecoration(
                    labelText: 'RDW',
                    hintText: 'Enter rdw',
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
                    return 'please enter tlc';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: tlc,
                decoration: InputDecoration(
                    labelText: 'TLC',
                    hintText: 'Enter tlc',
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
                    return 'please enter plt';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: plt,
                decoration: InputDecoration(
                    labelText: 'PLT',
                    hintText: 'Enter plt',
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
                    return 'please enter hgb';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: hgb,
                decoration: InputDecoration(
                    labelText: 'HGB',
                    hintText: 'Enter hgb',
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
                    callModel(hgb: hgb.text,mch: mch.text,mchc: mchc.text,mcv: mcv.text,pcv: pcv.text,plt: plt.text,rbc: rbc.text,rdw: rdw.text,tlc: tlc.text);
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
    required dynamic rbc,
    required dynamic pcv,
    required dynamic mcv,
    required dynamic mch,
    required dynamic mchc,
    required dynamic rdw,
    required dynamic tlc,
    required dynamic plt,
    required dynamic hgb,
  }) {

    DioHelper.postData(
      url: 'https://d297-41-46-11-49.ngrok-free.app/predict',
      data: {
        "RBC": rbc,
        "PCV": pcv,
        "MCV": mcv,
        "MCH": mch,
        "MCHC": mchc,
        "RDW": rdw,
        "TLC": tlc,
        "PLT": plt,
        "HGB": hgb,
      },
    ).then((value) {
      print(value.statusCode);
      print(value.statusMessage);
      print(value.data);

      print(value.data["message"]);
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
            content: Text('${value.data["message"]}'),
          ));

      setState(() {

      });
    }).catchError((error) {
      print("error $error");
      setState(() {});
    });
  }
}
