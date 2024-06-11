
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Buy-done.dart';

class View_medicene extends StatefulWidget {
  Map map={};
  View_medicene(Map m)
  {
    map=m;
  }

  @override
  State<View_medicene> createState() => _View_mediceneState();
}

class _View_mediceneState extends State<View_medicene> {
  int x=0;
  num t=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            //الشريط الاعلي
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Medicine,',style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Icon(Icons.format_list_bulleted_outlined,size: 35.0,)
                ],
              ),
            ),
            SizedBox(height: 35,),
            CircleAvatar(
              backgroundColor: Colors.grey[400],
              backgroundImage: AssetImage(widget.map['image'],),
              radius: 75.0,
            ),
            SizedBox(height: 20,),
            Text('${widget.map['name']}',style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 10,),
            Text('${widget.map['years']}',style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 10,),
            Text('\$${widget.map['money']}',style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: HexColor('8a86e2'),
                  child: TextButton(
                    onPressed: ()
                    {
                      setState(() {
                        x++;
                        t=t+widget.map['money'];

                      });
                    },
                    child: Text('+',style: TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 15.0,),
                Text(x.toString(),style: TextStyle(color: HexColor('8a86e2'),fontSize: 25.0,fontWeight: FontWeight.bold),),
                SizedBox(width: 15.0,),
                Container(
                  color: HexColor('8a86e2'),
                  child: TextButton(
                    onPressed: ()
                    {
                      setState(() {
                        x--;
                       // t=t-widget.map['money'].;
                        if(x<0)
                          {
                            x=0;
                            t=0;
                          }

                      });
                    },
                    child: Text('-',style: TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],),
            SizedBox(height: 20,),
            Text('Total = \$ $t',style: TextStyle(color: HexColor('8a86e2'),fontSize: 30.0,fontWeight: FontWeight.bold),
        ),
            SizedBox(height: 15,),
            Container(
              color: Colors.pink[200],
              child: MaterialButton(onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Buy_done(n: widget.map['name'],num: x,m: t,)));
              },child: Text('BUY',style: TextStyle(color: HexColor('8a86e2'),fontSize: 25,fontWeight: FontWeight.bold),),),
            ),

          ],
        ),
      ),
    );
  }
}
