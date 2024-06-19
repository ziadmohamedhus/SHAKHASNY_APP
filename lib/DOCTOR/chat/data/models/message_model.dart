import 'package:cloud_firestore/cloud_firestore.dart';

class MessageDoctorModel {
  late String message;
  late String userId;
  late String pId;
  late Timestamp createdAt;
  late bool isRead;
  late bool isuser;

  MessageDoctorModel({
    required this.isuser,
    required this.message,
    required this.userId,
    required this.pId,
    required this.createdAt,
    required this.isRead,
  });

  MessageDoctorModel.fromJSon(json) {
    message = json['message'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    isRead = json['isRead'];
    isuser = json['is_user'];
    pId = json['pId'];
  }
}
