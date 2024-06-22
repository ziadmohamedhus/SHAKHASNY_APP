import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Api/api_service.dart';

class ChatBot extends StatefulWidget {
  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<Map> chat = [];
  int age=22;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chat = [];
    // callModel(msg: "ok");
    //  callModel(msg: "ziad");
    // callModel(msg: 22);

  }
  TextEditingController message = TextEditingController();

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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  return chat[index]["sender"] == "patient"
                      ? buildMyMessage(chat[index]["message"])
                      : buildDoctorMessage(chat[index]["message"]);
                },
              ),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter message';
                          }
                          return null;
                        },
                        controller: message,
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
                        if (message.text.isNotEmpty) {
                          setState(() {
                            chat.add({"sender": 'patient', "message": message.text});
                          });
                          callModel(msg: message.text);
                          setState(() {

                          });
                          message.clear();
                        }
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
    );
  }

  Widget buildDoctorMessage(String s) => Padding(
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
            //height: 100,
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
                s,
                style: TextStyle(fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.visible, // You can use TextOverflow.fade or TextOverflow.clip as well
              )
          ),
        ],
      ),
    ),
  );

  Widget buildMyMessage(String s) => Padding(
    padding: const EdgeInsets.all(3.0),
    child: Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                color: HexColor('ffe0f4').withOpacity(.9,),
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
                s,
                style: TextStyle(fontSize: 17),
                maxLines: 2,
                overflow: TextOverflow.visible, // You can use TextOverflow.fade or TextOverflow.clip as well
              )
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

  void callModel({required dynamic msg}) {
    print(msg);
    DioHelper.postData(
      url: 'https://110a-41-46-16-21.ngrok-free.app/get',
      data: {
        "msg": msg
      },
    ).then((value) {
      print(value.statusCode);
      print(value.statusMessage);
      print(value.data);

      print(value.data["message"]);
      setState(() {
        chat.add({"sender": 'ai', "message": value.data["message"]});
      });
    }).catchError((error) {
      print("error $error");
      setState(() {});
      });
    }

}
