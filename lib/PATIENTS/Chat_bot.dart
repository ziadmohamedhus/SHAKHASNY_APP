
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Chat_bot extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(
                  'asset/image/robot.png',
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                'DR:ZYS',
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  build_My_Message('Hi doctor'),
                  build_doctor_Message('Hello Ziad how are you?!'),
                  build_My_Message('i feel bad 🤒'),
                  build_My_Message('i feel pain in my foot'),
                  build_doctor_Message('oh sorry! '),
                  build_My_Message('ok iok iok iok iok i'),
                  build_doctor_Message('ok iokvsfvs'),

                ],),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: TextFormField(
                          //controller: messageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'type your message here ...',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      color: HexColor('8a86e2'),
                      child: MaterialButton(
                        onPressed: () {

                        },
                        minWidth: 1.0,
                        child: Icon(
                          Icons.send,
                          size: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }



  Widget build_doctor_Message(String s) => Padding(
    padding: const EdgeInsets.all(3.0),
    child: Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(
              'asset/image/robot.png',
            ),
          ),
          SizedBox(
            width: 7.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: HexColor('8a86e2').withOpacity(0.5),
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(
                  20.0,
                ),
                topStart: Radius.circular(
                  20.0,
                ),
                topEnd: Radius.circular(
                  20.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20.0,
            ),
            child: Text(
              s,style: TextStyle(fontSize: 17,),
            ),
          ),
        ],
      ),
    ),
  );

  Widget build_My_Message(String s) => Padding(
    padding: const EdgeInsets.all(3.0),
    child: Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(
            decoration: BoxDecoration(
              color:HexColor('ffe0f4').withOpacity(.9,),
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(
                  20.0,
                ),
                topStart: Radius.circular(
                  20.0,
                ),
                topEnd: Radius.circular(
                  20.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20.0,
            ),
            child: Text(
              s,style: TextStyle(fontSize: 17,),
            ),
          ),
          SizedBox(
            width: 7.0,
          ),
          CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(
              'asset/image/1.jpg',
            ),
          ),

        ],
      ),
    ),
  );
}
