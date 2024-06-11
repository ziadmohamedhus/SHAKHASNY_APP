
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'Start.dart';
class Animation1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHAKHSNI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container( child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_h55dw0gs.json')),
            SizedBox(height: 20,),
            Text('SHAKHSNI',style: TextStyle(color: HexColor('8a86e2'),fontWeight: FontWeight.bold,fontSize: 30),),
            InkWell(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Start()));},
                child: Container(child: Lottie.network('https://assets3.lottiefiles.com/datafiles/ft3xlpduRes83XO/data.json'))),
          ],
        ),
      ),
    );
  }
}
