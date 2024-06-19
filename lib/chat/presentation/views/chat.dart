import 'package:auto_direction/auto_direction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          Container(
                            color: Colors.blue,
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
                                      // fontFamily:
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ),
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
