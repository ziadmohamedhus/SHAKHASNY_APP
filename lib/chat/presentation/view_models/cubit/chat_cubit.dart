import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/constant.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);

  // void init(String store_id) {
  //   // String uid=getData.read("UserLogin")["id"];
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .collection('chats')
  //       .doc(store_id)
  //       .collection('messages');
  //
  //       FirebaseFirestore.instance
  //       .collection('pharmacies')
  //       .doc(store_id)
  //       .collection('chats')
  //       .doc(uid)
  //       .collection('messages');
  // }

  // void initpharma(String store_id) {
  //   String uid=getData.read("UserLogin")["id"];
  //       FirebaseFirestore.instance
  //       .collection('pharmacies')
  //       .doc(store_id)
  //       .collection('chats')
  //       .doc(uid)
  //       .collection('messages');
  // }

  // void initAdmin(AllUserModel allUserModel) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(allUserModel.id.toString())
  //       .set({
  //     'name': allUserModel.fullName,
  //     'id': allUserModel.id,
  //     'lastUpdated': DateTime.now(),
  //   });
  // }

  // void addMessage({required String message, required int id}) {
  //   messagesList.add(MessageModel(message, id));
  //   emit(ChatSuccess());
  // }

  String? text;
  void updateText(String newText) {
    text = newText;
    emit(ChatUpdateText());
  }

  // List<MessageModel> messages = [];

  // void getMessages() {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(model!.id.toString())
  //       .collection('messages')
  //       .orderBy('createdAt')
  //       .snapshots()
  //       .listen((event) {
  //     messages = [];

  //     event.docs.forEach((element) {
  //       print(element);
  //       messages.add(MessageModel.fromJSon(element.data()));
  //     });
  //     emit(GetMessageSuccessState());
  //     print(messages);
  //   });
  // }

  // void sendMessage({
  //   required String message,
  // }) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(model!.id.toString())
  //       .collection('messages')
  //       .add({
  //     'message': message,
  //     'role_type': user_role!,
  //     'createdAt': DateTime.now().toString()
  //   }).then((value) {
  //     emit(SendMessageSuccessState());
  //   }).catchError((error) {
  //     print(error);
  //     emit(SendMessageFailureState());
  //   });
  // }

  // Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(int id) {
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(id.toString())
  //       .collection('messages')
  //       .orderBy('createdAt', descending: true)
  //       .limit(1)
  //       .snapshots();
  // }
  Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(int id) {
    return FirebaseFirestore.instance
        .collection('doctors')
        .doc(patient_model!.data!.id.toString())
        .collection("chats")
        .doc(id.toString())
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots();
  }
}
