import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/constant.dart';

import '../../../../chat/presentation/view_models/cubit/chat_cubit.dart';
import '../../data/models/admin_chat_model.dart';
import '../../data/models/message_model.dart';
import 'chat_details.dart';

class ChatDoctorScreen extends StatelessWidget {
  ChatDoctorScreen();
  TextEditingController search = TextEditingController();

  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate(); // Convert Timestamp to DateTime
    String formattedDate =
        '${dateTime.hour}:${dateTime.minute} ${dateTime.day}/${dateTime.month}';
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('doctors')
        .doc(patient_model!.data!.id.toString())
        .collection('chats');

    return StreamBuilder<QuerySnapshot>(
        stream: users.orderBy('lastUpdated', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AdminMessageModel> usersList = [];
            for (var doc in snapshot.data!.docs) {
              usersList.add(AdminMessageModel.fromJSon(doc));
            }
            print(usersList);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Container(),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: usersList.length,
                        itemBuilder: (context, index) =>
                            buildChat(usersList[index])),
                  ),
                ]),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildChat(AdminMessageModel adminMessageModel) {
    MessageDoctorModel? messageModel;

    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          return StreamBuilder<QuerySnapshot>(
              stream:
                  ChatCubit.get(context).getLastMessage(adminMessageModel.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!.docs;
                  final list = data
                      .map((e) => MessageDoctorModel.fromJSon(
                          e.data() as Map<String, dynamic>))
                      .toList();
                  if (list.isNotEmpty) messageModel = list[0];
                }

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreenDetails(
                                  user_id: adminMessageModel.id!,
                                )));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.green,
                        ], // Define your gradient colors here
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.3, 1],
                        // Optional: define stops for the gradient
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Stack(
                          alignment: Alignment.bottomRight,
                          children: [],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${adminMessageModel.name}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${messageModel?.message}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(messageModel == null
                                          ? ''
                                          : formatTimestamp(
                                              messageModel!.createdAt)),
                                      messageModel?.isRead == false
                                          ? const SizedBox(
                                              width: 5,
                                            )
                                          : Container(),
                                      messageModel?.isRead == false
                                          ? const Icon(
                                              Icons.circle,
                                              color: Color.fromARGB(
                                                  255, 18, 217, 28),
                                              size: 10,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
