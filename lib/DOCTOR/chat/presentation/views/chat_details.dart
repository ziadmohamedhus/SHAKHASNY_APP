import 'package:auto_direction/auto_direction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/constant.dart';

import '../../../../chat/data/models/message_model.dart';
import '../../../../chat/presentation/view_models/cubit/chat_cubit.dart';
import '../../../../chat/presentation/views/widgets/chat_bubble.dart';

class ChatScreenDetails extends StatelessWidget {
  ChatScreenDetails({required this.user_id});

  TextEditingController controller = TextEditingController();
  final int user_id;

  final scrollController = ScrollController();

  void sendMessage(String message) async {
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(patient_model!.data!.id.toString())
        .collection('chats')
        .doc(user_id.toString())
        .collection('messages')
        .add({
      'message': message,
      'createdAt': Timestamp.now(),
      'userId': user_id.toString(),
      'pId': patient_model!.data!.id.toString(),
      'isRead': true,
      "is_user": false,
    });

    // Add message to user's chat
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user_id.toString())
        .collection('chats')
        .doc(patient_model!.data!.id.toString())
        .collection('messages')
        .add({
      'message': message,
      'createdAt': Timestamp.now(),
      'userId': user_id.toString(),
      'pId': patient_model!.data!.id.toString(),
      "is_user": false,
      'isRead': true,
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference messages = FirebaseFirestore.instance
        .collection('doctors')
        .doc(patient_model!.data!.id.toString())
        .collection('chats')
        .doc(user_id.toString())
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

                    FirebaseFirestore.instance
                        .collection('doctors')
                        .doc(patient_model!.data!.id.toString())
                        .collection('chats')
                        .doc(user_id.toString())
                        .collection('messages')
                        .doc(snapshot.data!.docs[i].id)
                        .update({'isRead': true});

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
                        elevation: 0.0,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Chat',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      body: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: scrollController,
                              itemCount: messagesList.length,
                              itemBuilder: (context, index) {
                                return messagesList[index].isuser == true
                                    ? ChatBubbleForBot(
                                        message: messagesList[index].message,
                                      )
                                    : ChatBubble(
                                        message: messagesList[index].message,
                                      );
                              },
                            ),
                          ),
                          Container(
                            color: Colors.green,
                            padding: const EdgeInsets.all(16.0),
                            child: AutoDirection(
                              text: ChatCubit.get(context).text ?? "",
                              child: TextField(
                                controller: controller,
                                onChanged: (value) {
                                  ChatCubit.get(context).updateText(value);
                                },
                                // keyboardType: TextInputType.multiline,
                                // minLines: 1,
                                // maxLines: 2,
                                style: const TextStyle(color: Colors.white),
                                onSubmitted: (value) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                decoration: InputDecoration(
                                    hintText: 'send message....',
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        sendMessage(controller.text);
                                        controller.clear();
                                        scrollController.animateTo(
                                            scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn);
                                      },
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ))),
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
