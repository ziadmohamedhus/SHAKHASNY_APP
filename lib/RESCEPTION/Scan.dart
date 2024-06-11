import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:hexcolor/hexcolor.dart';

import '../components.dart';

class Scan extends StatefulWidget {

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  var qr = "";
  bool found = false;
  var name = "";
  var phone = "";
  var date = "";
  var time = "";
  var country = "";
  var statuse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(child:
          Column(
            children: [
              SizedBox(height: 30,),
              InkWell(
                onTap: scanqr,
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent[100]!.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Image.asset('asset/icon/qr-code.png', height: 60,),
                      SizedBox(height: 10),
                      Text('SCAN!',
                        style: TextStyle(color: HexColor('32313a'), fontSize: 20.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),

              if(found)
              Column(
              children: [
                   Text('NAME, $name', style: TextStyle(color: HexColor('8a86e2'), fontSize: 30.0, fontWeight: FontWeight.bold),),
                  SizedBox(height: 40,),
                  Text('PHONE: $phone ', style: TextStyle(color: Colors.pink[200], fontSize: 20.0, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                   Text('VISIT DATE : $date ', style: TextStyle(color: Colors.pink[200], fontSize: 20.0, fontWeight: FontWeight.bold),),
                   SizedBox(height: 30,),
                   Text('VISIT TIME : $time ', style: TextStyle(color: Colors.pink[200], fontSize: 20.0, fontWeight: FontWeight.bold),),
                   SizedBox(height: 30,),
                   Text('STATUS : $statuse ', style: TextStyle(color: Colors.pink[200], fontSize: 20.0, fontWeight: FontWeight.bold),),
                   SizedBox(height: 30,),
                ],)
              else
                 Column(
                   children: [
                     SizedBox(height: 100,),
                     Container(child: Column(children: [
                        Text('THERE IS NO DATA TO DISPLAY',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        SizedBox(height: 10,),
                        Icon(Icons.no_accounts_rounded,size: 165,color: Colors.grey[500],)
                      ],),),
                   ],
                 )



            ],),),
        ),
      ),
    );
  }

  Future<void> scanqr() async
  {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          qr = value;
          for (int i = 0; i < Appointement_list.length; i++) {
            if (Appointement_list[i]['name']==value)
              {
                name=Appointement_list[i]['name'];
                phone=Appointement_list[i]['phone'];
                date=Appointement_list[i]['date'];
                time=Appointement_list[i]['time'];
                country=Appointement_list[i]['country'];
                statuse=Appointement_list[i]['status'];
                found=true;

              }
          }
        });
      });
    } catch (e) {}
  }
}
