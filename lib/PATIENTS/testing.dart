
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Testing extends StatelessWidget {

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
                  prefixIcon: Icon(Icons.phone),
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
            
          ],),
        ),
      ),
    );
  }
}
