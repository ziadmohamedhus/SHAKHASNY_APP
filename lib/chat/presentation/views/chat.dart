import 'package:auto_direction/auto_direction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/chat/presentation/view_models/cubit/chat_cubit.dart';
import 'package:hospital/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:hospital/constant.dart';

import '../../data/models/message_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({required this.doc_id});
  final String doc_id;
  TextEditingController controller = TextEditingController();
  final scrollController = ScrollController();

  void sendMessage(String message) async {
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(doc_id)
        .collection('chats')
        .doc(patient_model!.data!.id.toString())
        .collection('messages')
        .add({
      'message': message,
      'createdAt': Timestamp.now(),
      'userId': patient_model!.data!.id.toString(),
      'isRead': false,
      'is_user': true,
      'pId': doc_id,
    });

    // Set up or update the pharmacy's chat document
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(doc_id)
        .collection('chats')
        .doc(patient_model!.data!.id.toString())
        .set({
      'userId': int.parse(patient_model!.data!.id.toString()),
      'lastUpdated': Timestamp.now(),
      'name': patient_model!.data!.firstName! + patient_model!.data!.lastName!,
    });

    // Add message to user's chat
    await FirebaseFirestore.instance
        .collection('users')
        .doc(patient_model!.data!.id.toString())
        .collection('chats')
        .doc(doc_id)
        .collection('messages')
        .add({
      'message': message,
      'createdAt': Timestamp.now(),
      'userId': patient_model!.data!.id.toString(),
      'isRead': false,
      'is_user': true,
      'pId': doc_id,
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference messages = FirebaseFirestore.instance
        .collection('users')
        .doc(patient_model!.data!.id.toString())
        .collection('chats')
        .doc(doc_id)
        .collection('messages');
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return StreamBuilder<QuerySnapshot>(
              stream: messages.orderBy('createdAt').snapshots(),
              builder: (context, snapshot) {
                List<MessageModel> messagesList = [];
                if (snapshot.hasData) {
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    MessageModel message =
                        MessageModel.fromJSon(snapshot.data!.docs[i]);
                    messagesList.add(message);
                  }
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
                  return Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        centerTitle: true,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        leading: BackButton(
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        title: Text(
                          'chat',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      body: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: scrollController,
                              itemCount: messagesList.length,
                              itemBuilder: (context, index) {
                                return messagesList[index].isuser == false
                                    ? ChatBubbleForBot(
                                        message: messagesList[index].message,
                                      )
                                    : ChatBubble(
                                        message: messagesList[index].message,
                                      );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                                      child: AutoDirection(
                                        text: ChatCubit.get(context).text ?? "",
                                        child: TextFormField(
                                          onChanged: (value) {
                                            ChatCubit.get(context).updateText(value);
                                          },

                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter message';
                                            }
                                            return null;
                                          },
                                          controller: controller,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'type your message here ...',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50.0,
                                    color: HexColor('8a86e2'),
                                    child: MaterialButton(
                                      onPressed: () async {
                                        // Add message to pharmacy's chat
                                        sendMessage(controller.text);

                                        controller.clear();
                                        scrollController.animateTo(
                                            scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                            const Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn);
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
                          ),
                        ],
                      ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              });
        },
      ),
    );
  }
}
